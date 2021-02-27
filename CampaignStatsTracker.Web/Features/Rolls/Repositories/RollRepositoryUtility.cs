using System.Data;
using System.Threading.Tasks;
using Dapper;
using CampaignStatsTracker.Web.Data.Connections;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    sealed internal class RollRepositoryUtility : IRollRepositoryUtility
    {
        private readonly ICampaignStatsTrackerDbConnectionFactory _connectionFactory;

        public RollRepositoryUtility(ICampaignStatsTrackerDbConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task InsertRollAsync(string procedureName, object rollData)
        {
            using var connection = _connectionFactory.GetWriteConnection();
            await connection.QueryAsync(procedureName, rollData, commandType: CommandType.StoredProcedure);
        }
    }
}