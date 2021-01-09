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

        private SqlParameter getParameter(SqlCommand command, string name, object value)
        {
            var parameter = command.CreateParameter();
            parameter.Value = value;
            parameter.ParameterName = name;

            return parameter;
        }

        private SqlParameter getParameter(SqlCommand command, string name, object value, string typeName)
        {
            var parameter = getParameter(command, name, value);
            parameter.TypeName = typeName;

            return parameter;
        }

        private void AddSkillRollParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("NumberOfSides", typeof(int));
            table.Columns.Add("Value", typeof(int));

            var row = table.NewRow();
            row["NumberOfSides"] = 20;
            row["Value"] = roll.RollValue;
            table.Rows.Add(row);

            var parameter = getParameter(command, "@Dice", table, "[Rolls].[DieRollType]");
            command.Parameters.Add(parameter);
        }

        private void AddSkillRollModifierParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("Value", typeof(int));

            if (roll.RollModifier != 0)
            {
                var row = table.NewRow();
                row["Value"] = roll.RollModifier;
                table.Rows.Add(row);
            }

            var parameter = getParameter(command, "@Modifiers", table, "[Rolls].[RollModifierType]");
            command.Parameters.Add(parameter);
        }

        private void AddDamageRollParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("NumberOfSides", typeof(int));
            table.Columns.Add("Value", typeof(int));

            if (roll.RollSucceeded)
            {
                foreach (var dr in roll.DamageRolls)
                {
                    var row = table.NewRow();
                    row["NumberOfSides"] = dr.NumberOfSides;
                    row["Value"] = dr.Result;
                    table.Rows.Add(row);
                }
            }

            var parameter = getParameter(command, "@DamageDice", table, "[Rolls].[DieRollType]");
            command.Parameters.Add(parameter);
        }

        private void AddDamageRollModifierParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("Value", typeof(int));

            if (roll.DamageModifier != 0)
            {
                var row = table.NewRow();
                row["Value"] = roll.DamageModifier;
                table.Rows.Add(row);
            }

            var parameter = getParameter(command, "@DamageModifiers", table, "[Rolls].[RollModifierType]");
            command.Parameters.Add(parameter);
        }

        private void AddDamageTypeParameter(SqlCommand command, RollPost roll)
        {
            var parameter = getParameter(command, "@DamageType", "");
            command.Parameters.Add(parameter);
        }

        private void AddDamageSourceParameter(SqlCommand command, RollPost roll)
        {
            var parameter = getParameter(command, "@DamageSource", "");
            command.Parameters.Add(parameter);
        }

        private void AddCommentParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("Comment", typeof(string));


            var row = table.NewRow();
            row["Comment"] = roll.RollComment;
            table.Rows.Add(row);

            var parameter = getParameter(command, "@Comments", table, "[Rolls].[RollCommentType]");
            command.Parameters.Add(parameter);
        }

        private void AddSuccessParameter(SqlCommand command, RollPost roll)
        {
            var parameter = getParameter(command, "@Success", roll.RollSucceeded);
            command.Parameters.Add(parameter);
        }

        private void AddSkillTypeParameter(SqlCommand command, RollPost roll)
        {
            var parameter = getParameter(command, "@SkillType", roll.SkillType);
            command.Parameters.Add(parameter);
        }

        private void AddEntitiesParameter(SqlCommand command, RollPost roll)
        {
            var table = new DataTable();
            table.Columns.Add("PublicId", typeof(Guid));

            if (roll.Entities != null)
            {
                foreach (var entity in roll.Entities)
                {
                    var row = table.NewRow();
                    row["PublicId"] = entity.PublicId;
                    table.Rows.Add(row);
                }
            }

            var parameter = getParameter(command, "@AssociatedEntities", table, "[Entities].[EntitiesType]");
            command.Parameters.Add(parameter);
        }

        private void AddRankParameter(SqlCommand command, RollPost roll)
        {
            var parameter = getParameter(command, "@Rank", roll.InitiativeRank);
            command.Parameters.Add(parameter);
        }

        public async Task InsertRollAsync(RollPost roll)
        {
            //TODO: USE DAPPER FOR GOD'S SAKE
            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                await connection.OpenAsync();

                var command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;

                AddCommentParameter(command, roll);
                AddEntitiesParameter(command, roll);
                AddSkillRollParameter(command, roll);
                AddSkillRollModifierParameter(command, roll);

                switch (roll.RollType.ToLower())
                {
                    case "attack":
                        command.CommandText = "[Rolls].[Sto_InsertAttackRoll]";

                        AddSuccessParameter(command, roll);
                        AddSkillTypeParameter(command, roll);

                        AddDamageRollParameter(command, roll);
                        AddDamageRollModifierParameter(command, roll);
                        AddDamageTypeParameter(command, roll);
                        AddDamageSourceParameter(command, roll);

                        break;
                    case "skill":
                        command.CommandText = "[Rolls].[Sto_InsertSkillRoll]";

                        AddSuccessParameter(command, roll);
                        AddSkillTypeParameter(command, roll);

                        break;
                    case "initiative":
                        command.CommandText = "[Rolls].[Sto_InsertInitiativeRoll]";

                        AddRankParameter(command, roll);

                        break;
                }

                var reader = await command.ExecuteReaderAsync();
            }
        }
    }
}