using Dapper;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class InitiativeRollRepositoryDto : BaseRollRepositoryDto
    {
        public int Rank { get; set; }
    }
}