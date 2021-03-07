using System;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class SavingThrowRepositoryDto : BaseRollRepositoryDto
    {
        public string AttributeType { get; set; }
        public Nullable<bool> Success { get; set; }
    }
}