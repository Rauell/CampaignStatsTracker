using System.Threading.Tasks;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    public interface IRollRepositoryUtility
    {
        Task InsertRollAsync(string procedureName, object rollData);
    }
}