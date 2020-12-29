using System;
using System.Collections.Generic;
using System.Linq;
using CampaignStatsTracker.Models.Rolls;

namespace CampaignStatsTracker.Models
{
    public class Encounter
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime CreatedAt { get; set; }
        public IEnumerable<AttackRoll> AttackRolls { get; set; }
        public IEnumerable<InitiativeRoll> InitiativeRolls { get; set; }
        public IEnumerable<SkillRoll> SkillRolls { get; set; }
        public IEnumerable<Roll> Rolls
        {
            get
            {
                return AttackRolls.Cast<Roll>()
                    .Concat(InitiativeRolls.Cast<Roll>())
                    .Concat(SkillRolls.Cast<Roll>());
            }
        }
    }
}
