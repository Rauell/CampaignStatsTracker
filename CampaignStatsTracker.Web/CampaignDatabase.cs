using System;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using CampaignStatsTracker.Models.Views.Entities;
using CampaignStatsTracker.Models.Views;
using Dapper;

namespace CampaignStatsTracker.Database
{
    public class CampaignDatabase
    {
        private readonly SqlConnectionStringBuilder _connectionBuilder;

        public CampaignDatabase()
        {
            _connectionBuilder = new SqlConnectionStringBuilder();

            _connectionBuilder.DataSource = "localhost\\SQLEXPRESS";
            _connectionBuilder.IntegratedSecurity = true;
            _connectionBuilder.InitialCatalog = "CampaignStatsTracker.Database";
        }

        public async Task<IEnumerable<Campaign>> GetCampaigns()
        {
            IEnumerable<Campaign> results;
            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                var procedure = "[Games].[Sto_GetCampaigns]";
                results = await connection.QueryAsync<Campaign>(procedure, commandType: CommandType.StoredProcedure);
            }

            return results;
        }

        public async Task<Campaign> GetCampaignStatsById(Guid Id)
        {
            Campaign campaign;

            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                var procedure = "[Games].[Sto_GetCampaignDetailsById]";
                var parameters = new { PublicId = Id };

                var reader = await connection.QueryMultipleAsync(
                    procedure,
                    parameters,
                    commandType: CommandType.StoredProcedure);

                campaign = await reader.ReadSingleOrDefaultAsync<Campaign>();

                if (campaign is null)
                {
                    return null;
                }

                var characters = await reader.ReadAsync<Character>();
                campaign.Characters = characters;

                var stats = await reader.ReadSingleOrDefaultAsync<DatabaseStatsDto>();
                campaign.Stats = stats.ToCombinedStats();
            }

            return campaign;
        }

        public async Task<IEnumerable<EntityWithStats>> GetStatsAsync(IEnumerable<Guid> publicIds) =>
            await GetStatsAsync(publicIds.Select(p => new Entity() { PublicId = p }));

        public async Task<IEnumerable<EntityWithStats>> GetStatsAsync(IEnumerable<Entity> entities)
        {
            var entityTable = new DataTable();
            entityTable.Columns.Add("PublicId", typeof(Guid));

            if (entities != null)
            {
                foreach (var entity in entities)
                {
                    var entityRow = entityTable.NewRow();
                    entityRow["PublicId"] = entity.PublicId;
                    entityTable.Rows.Add(entityRow);
                }
            }

            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                var reader = await connection.QueryMultipleAsync(
                    "[Rolls].[Sto_GetRollStatsForEntities]",
                    new { Entities = entityTable },
                    commandType: CommandType.StoredProcedure
                );

                var stats = await reader.ReadAsync<DatabaseStatsDto>();

                return stats.Select(s => s.ToEntityWithStats());
            }
        }

        public async Task InsertRoll(RollPost roll)
        {
            var isAttackRoll = string.Equals(roll.RollType, "attack", StringComparison.CurrentCultureIgnoreCase);

            var skillRollTable = new DataTable();
            skillRollTable.Columns.Add("NumberOfSides", typeof(int));
            skillRollTable.Columns.Add("Value", typeof(int));

            var skillRollRow = skillRollTable.NewRow();
            skillRollRow["NumberOfSides"] = 20;
            skillRollRow["Value"] = roll.RollValue;
            skillRollTable.Rows.Add(skillRollRow);

            var skillModifierTable = new DataTable();
            skillModifierTable.Columns.Add("Comment", typeof(string));
            skillModifierTable.Columns.Add("Value", typeof(int));

            if (roll.RollModifer != 0)
            {
                var skillModifierRow = skillModifierTable.NewRow();
                skillModifierRow["Comment"] = "";
                skillModifierRow["Value"] = roll.RollModifer;
                skillModifierTable.Rows.Add(skillModifierRow);
            }

            var commentTable = new DataTable();
            commentTable.Columns.Add("Comment", typeof(string));

            var commentRow = commentTable.NewRow();
            commentRow["Comment"] = roll.RollComment;
            commentTable.Rows.Add(commentRow);

            var entityTable = new DataTable();
            entityTable.Columns.Add("PublicId", typeof(Guid));

            if (roll.Entities != null)
            {
                foreach (var entity in roll.Entities)
                {
                    var entityRow = entityTable.NewRow();
                    entityRow["PublicId"] = entity.PublicId;
                    entityTable.Rows.Add(entityRow);
                }
            }

            //TODO: USE DAPPER FOR GOD'S SAKE
            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                await connection.OpenAsync();

                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;

                if (isAttackRoll)
                {
                    command.CommandText = "[Rolls].[Sto_InsertAttackRoll]";

                    var damageRollTable = new DataTable();
                    damageRollTable.Columns.Add("NumberOfSides", typeof(int));
                    damageRollTable.Columns.Add("Value", typeof(int));

                    if (roll.RollSucceeded)
                    {
                        foreach (var dr in roll.DamageRolls)
                        {
                            var damageRollRow = damageRollTable.NewRow();
                            damageRollRow["NumberOfSides"] = dr.NumberOfSides;
                            damageRollRow["Value"] = dr.Result;
                            damageRollTable.Rows.Add(damageRollRow);
                        }
                    }

                    var damageModifierTable = new DataTable();
                    damageModifierTable.Columns.Add("Comment", typeof(string));
                    damageModifierTable.Columns.Add("Value", typeof(int));

                    // var damageModifierRow = damageModifierTable.NewRow();
                    // damageModifierRow["Comment"] = "";
                    // damageModifierRow["Value"] = 0;
                    // damageModifierTable.Rows.Add(damageModifierRow);

                    var skillRollParameter = command.CreateParameter();
                    skillRollParameter.TypeName = "[Rolls].[DieRollType]";
                    skillRollParameter.Value = skillRollTable;
                    skillRollParameter.ParameterName = "@HitDice";
                    command.Parameters.Add(skillRollParameter);

                    var skillModifierParameter = command.CreateParameter();
                    skillModifierParameter.TypeName = "[Rolls].[RollModifierType]";
                    skillModifierParameter.Value = skillModifierTable;
                    skillModifierParameter.ParameterName = "@HitModifiers";
                    command.Parameters.Add(skillModifierParameter);

                    var damageRollParameter = command.CreateParameter();
                    damageRollParameter.TypeName = "[Rolls].[DieRollType]";
                    damageRollParameter.Value = damageRollTable;
                    damageRollParameter.ParameterName = "@DamageDice";
                    command.Parameters.Add(damageRollParameter);

                    var damageModifierParameter = command.CreateParameter();
                    damageModifierParameter.TypeName = "[Rolls].[RollModifierType]";
                    damageModifierParameter.Value = damageModifierTable;
                    damageModifierParameter.ParameterName = "@DamageModifiers";
                    command.Parameters.Add(damageModifierParameter);

                    var damageTypeParameter = command.CreateParameter();
                    damageTypeParameter.Value = "";
                    damageTypeParameter.ParameterName = "@DamageType";
                    command.Parameters.Add(damageTypeParameter);

                    var damageSourceParameter = command.CreateParameter();
                    damageSourceParameter.Value = "";
                    damageSourceParameter.ParameterName = "@DamageSource";
                    command.Parameters.Add(damageSourceParameter);
                }
                else
                {
                    command.CommandText = "[Rolls].[Sto_InsertSkillRoll]";

                    var skillRollParameter = command.CreateParameter();
                    skillRollParameter.TypeName = "[Rolls].[DieRollType]";
                    skillRollParameter.Value = skillRollTable;
                    skillRollParameter.ParameterName = "@Dice";
                    command.Parameters.Add(skillRollParameter);

                    var skillModifierParameter = command.CreateParameter();
                    skillModifierParameter.TypeName = "[Rolls].[RollModifierType]";
                    skillModifierParameter.Value = skillModifierTable;
                    skillModifierParameter.ParameterName = "@Modifiers";
                    command.Parameters.Add(skillModifierParameter);
                }

                var successParameter = command.CreateParameter();
                successParameter.Value = roll.RollSucceeded;
                successParameter.ParameterName = "@Success";
                command.Parameters.Add(successParameter);

                var skillTypeParameter = command.CreateParameter();
                skillTypeParameter.Value = roll.SkillType;
                skillTypeParameter.ParameterName = "@SkillType";
                command.Parameters.Add(skillTypeParameter);

                var commentParameter = command.CreateParameter();
                commentParameter.TypeName = "[Rolls].[RollCommentType]";
                commentParameter.Value = commentTable;
                commentParameter.ParameterName = "@Comments";
                command.Parameters.Add(commentParameter);

                var entityParameter = command.CreateParameter();
                entityParameter.TypeName = "[Entities].[EntitiesType]";
                entityParameter.Value = entityTable;
                entityParameter.ParameterName = "@AssociatedEntities";
                command.Parameters.Add(entityParameter);

                var reader = await command.ExecuteReaderAsync();
            }
        }
    }
}