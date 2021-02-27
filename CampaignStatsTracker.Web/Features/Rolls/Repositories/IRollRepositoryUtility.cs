using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    public interface IRollRepositoryUtility
    {
        Task InsertRollAsync<T>(string procedureName, ClientRollDTO rollData) where T : BaseRollRepositoryDto;
    }
}