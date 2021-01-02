using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Views.Stats;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public class Character : Entity
    {
        public string Name { get; set; }
        public CombinedStats Stats { get; set; }
    }
}
