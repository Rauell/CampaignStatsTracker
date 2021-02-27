using System.Data;
using System.Threading.Tasks;
using AutoMapper;
using Dapper;
using CampaignStatsTracker.Web.Data.Connections;
using CampaignStatsTracker.DTOs.Client;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    sealed internal class RollRepositoryUtility : IRollRepositoryUtility
    {
        private readonly IMapper _mapper;
        private readonly ICampaignStatsTrackerDbConnectionFactory _connectionFactory;

        public RollRepositoryUtility(
            IMapper mapper,
            ICampaignStatsTrackerDbConnectionFactory connectionFactory)
        {
            _mapper = mapper;
            _connectionFactory = connectionFactory;
        }

        public async Task InsertRollAsync<T>(string procedureName, ClientRollDTO roll)
        {
            using var connection = _connectionFactory.GetWriteConnection();
            await connection.QueryAsync(procedureName, _mapper.Map<T>(roll), commandType: CommandType.StoredProcedure);
        }
    }
}