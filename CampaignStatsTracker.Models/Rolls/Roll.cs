using System;
using System.Collections.Generic;
using System.Linq;
using CampaignStatsTracker.Models.Dice;

namespace CampaignStatsTracker.Models.Rolls
{
    public class Roll
    {
        public Guid Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public User User { get; set; }
        public string AttributeName { get; set; }
        public int AttributeModifer { get; set; }
        public int ExtraModifier { get; set; }
        public IEnumerable<Die> Dice { get; set; }
        public int Result => Dice.Sum(d => d.Value) + AttributeModifer + ExtraModifier;
    }
}
