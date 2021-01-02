using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Views.Stats;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public class Campaign : EntityWithStats
    {
        public string Name { get; set; }
        public IEnumerable<Character> Characters { get; set; }
    }
}
