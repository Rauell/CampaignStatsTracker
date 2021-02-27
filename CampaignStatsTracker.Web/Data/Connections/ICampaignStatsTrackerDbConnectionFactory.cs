using System.Data;

namespace CampaignStatsTracker.Web.Data.Connections
{
    public interface ICampaignStatsTrackerDbConnectionFactory
    {
        IDbConnection GetReadConnection();
        IDbConnection GetWriteConnection();
    }
}