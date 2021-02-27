using System;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using CampaignStatsTracker.Models.Views.Entities;
using CampaignStatsTracker.Models.Views;
using CampaignStatsTracker.DTOs.Client;
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
            // _connectionBuilder.InitialCatalog = "CampaignStatsTracker";
            _connectionBuilder.InitialCatalog = "TrackerTest";
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

                var rolls = await reader.ReadAsync<RollListingDto>();
                campaign.LatestRolls = rolls;
            }

            return campaign;
        }

        public async Task<IEnumerable<EntityWithStats>> GetStatsAsync(IEnumerable<Guid> publicIds) =>
            await GetStatsAsync(publicIds.Select(p => new Entity() { PublicId = p }));


        private async Task<EntityWithStats> PopulateEntityWithStatsAsync(DatabaseStatsDto stats)
        {
            var entity = stats.ToEntityWithStats();
            entity.LatestRolls = await GetLatestRollsAsync(stats.PublicId);
            return entity;
        }

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
                var stats = await connection.QueryAsync<DatabaseStatsDto>(
                    "[Rolls].[Sto_GetRollStatsForEntities]",
                    new { Entities = entityTable },
                    commandType: CommandType.StoredProcedure
                );

                var tasks = await Task.WhenAll(stats.Select(s => PopulateEntityWithStatsAsync(s)));

                return tasks.Where(r => r != null);
            }
        }

        public async Task<IEnumerable<RollListingDto>> GetLatestRollsAsync(Guid publicId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                return await connection.QueryAsync<RollListingDto>(
                    "[Rolls].[Sto_GetLastRollsForEntity]",
                    new { PublicId = publicId },
                    commandType: CommandType.StoredProcedure
                );
            }
        }

        public async Task<RollPost> GetRollDetailsAsync(Guid publicId)
        {
            using (SqlConnection connection = new SqlConnection(_connectionBuilder.ConnectionString))
            {
                return await connection.QuerySingleOrDefaultAsync<RollPost>(
                    "[Rolls].[Sto_GetRollDetails]",
                    new { PublicId = publicId },
                    commandType: CommandType.StoredProcedure
                );
            }
        }
    }
}