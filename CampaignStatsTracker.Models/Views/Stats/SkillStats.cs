using System;
using System.Collections.Generic;

namespace CampaignStatsTracker.Models.Views.Stats
{
    public class SkillStats
    {
        public float Average { get; set; }
        public float SuccessRate { get; set; }
        public float CriticalSuccessRate { get; set; }
        public float CriticalFailureRate { get; set; }
    }
}
