using System.Collections.Generic;

namespace CampaignStatsTracker.DTOs.Client
{
    public class MultiDieRollValues
    {
        public int DieType { get; set; }
        public IEnumerable<int> Values { get; set; }
    }
}