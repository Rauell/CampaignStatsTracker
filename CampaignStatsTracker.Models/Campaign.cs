using System;
using System.Collections.Generic;

namespace CampaignStatsTracker.Models
{
    public class Campaign
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedAt { get; set; }
        public IEnumerable<Encounter> Encounters { get; set; }
    }
}
