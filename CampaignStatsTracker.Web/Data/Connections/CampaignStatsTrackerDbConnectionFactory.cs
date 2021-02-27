using System.Data;
using System.Data.SqlClient;
using CampaignStatsTracker.Web.Configurations;

namespace CampaignStatsTracker.Web.Data.Connections
{
    public class CampaignStatsTrackerDbConnectionFactory : ICampaignStatsTrackerDbConnectionFactory
    {
        private readonly string _readOnlyConnectionString;
        private readonly string _readWriteConnectionString;

        public CampaignStatsTrackerDbConnectionFactory(CampaignTrackerConfiguration config)
        {
            _readOnlyConnectionString = config.ConnectionStrings.CampaignStatsTracker;
            _readWriteConnectionString = config.ConnectionStrings.CampaignStatsTracker;
        }

        public IDbConnection GetReadConnection() => new SqlConnection(_readOnlyConnectionString);

        public IDbConnection GetWriteConnection() => new SqlConnection(_readWriteConnectionString);
    }
}