using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    public interface IRollRepositoryUtility
    {
        Task InsertRollAsync<T>(string procedureName, ClientRollDTO rollData);
    }
}