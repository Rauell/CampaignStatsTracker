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

                var stats = await reader.ReadSingleOrDefaultAsync<DatabaseStatsDto>();

                campaign.Stats = stats.ToCombinedStats();
            }

            return campaign;
        }

        public async Task InsertRoll(RollPost roll)
        {
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

            var skillModifierRow = skillModifierTable.NewRow();
            skillModifierRow["Comment"] = "";
            skillModifierRow["Value"] = roll.RollModifer;
            skillModifierTable.Rows.Add(skillModifierRow);

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
                command.CommandText = "[Rolls].[Sto_InsertSkillRoll]";
                command.CommandType = CommandType.StoredProcedure;

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

                var successParameter = command.CreateParameter();
                // successParameter.TypeName = "BIT";
                successParameter.Value = roll.RollSucceeded;
                successParameter.ParameterName = "@Success";
                command.Parameters.Add(successParameter);

                var skillTypeParameter = command.CreateParameter();
                // skillTypeParameter.TypeName = "VARCHAR(50)";
                skillTypeParameter.Value = roll.SkillType;
                skillTypeParameter.ParameterName = "@SkillType";
                command.Parameters.Add(skillTypeParameter);

                var reader = await command.ExecuteReaderAsync();
            }
        }
    }
}