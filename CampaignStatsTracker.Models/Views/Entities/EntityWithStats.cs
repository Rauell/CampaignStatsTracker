using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Views.Stats;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public class EntityWithStats : Entity
    {
        public CombinedStats Stats { get; set; }
    }
}
