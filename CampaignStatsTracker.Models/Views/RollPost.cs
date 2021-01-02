using System;
using System.Collections.Generic;

namespace CampaignStatsTracker.Models.Views
{
    public class RollPost
    {
        public class DamageRoll
        {
            public int NumberOfSides { get; set; }
            public int Result { get; set; }
        }

        public class Entity
        {
            public Guid PublicId { get; set; }
        }

        public IEnumerable<Entity> Entities { get; set; }
        public IEnumerable<DamageRoll> DamageRolls { get; set; }
        public string RollComment { get; set; }
        public int RollModifer { get; set; }
        public bool RollSucceeded { get; set; }
        public string RollType { get; set; }
        public int RollValue { get; set; }
        public string SkillType { get; set; }
    }
}