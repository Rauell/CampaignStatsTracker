using System;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class SkillRollRepositoryDto : BaseRollRepositoryDto
    {
        public string SkillType { get; set; }
        public Nullable<bool> Success { get; set; }
    }
}