using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Views.Stats;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public class Campaign : Entity
    {
        public string Name { get; set; }
        public CombinedStats Stats { get; set; }
        public IEnumerable<Character> Characters { get; set; }
    }
}
