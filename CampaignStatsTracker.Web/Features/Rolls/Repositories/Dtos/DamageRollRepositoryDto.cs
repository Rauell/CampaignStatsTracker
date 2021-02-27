namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class DamageRollRepositoryDto : BaseRollRepositoryDto
    {
        public string DamageType { get; set; }
        public string DamageSource { get; set; }
    }
}