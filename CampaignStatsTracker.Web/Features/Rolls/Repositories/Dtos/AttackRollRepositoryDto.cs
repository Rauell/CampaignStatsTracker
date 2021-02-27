using System;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class AttackRollRepositoryDto : BaseRollRepositoryDto
    {
        public string SkillType { get; set; }
        public Nullable<bool> Hit { get; set; }
    }
}