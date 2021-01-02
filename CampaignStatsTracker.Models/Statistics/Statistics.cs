using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Rolls;
using CampaignStatsTracker.Models.Statistics;

namespace CampaignStatsTracker.Models.Statistics
{
    public class Statistics<T>
    {
        public float Mean { get; set; }
        public float StandardDeviation { get; set; }
        public float Variance { get; set; }
        public T Max { get; set; }
        public T Min { get; set; }
        public T Median { get; set; }
        public T Mode { get; set; }
    }
}
