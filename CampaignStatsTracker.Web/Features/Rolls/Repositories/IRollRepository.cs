using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    public interface IRollRepository
    {
        Task InsertRollAsync(ClientRollDTO roll);
    }
}