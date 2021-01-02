using System;
using System.Collections.Generic;
using CampaignStatsTracker.Models.Views.Stats;

namespace CampaignStatsTracker.Models.Views.Entities
{
    public class DatabaseStatsDto : Entity
    {
        public Guid PublicId { get; set; }
        public int D20SkillCount { get; set; }
        public int D20SkillCritSuccessCount { get; set; }
        public int D20SkillSuccessCount { get; set; }
        public float D20SkillAverage { get; set; }
        public int D20AttackCount { get; set; }
        public int D20AttackCritCount { get; set; }
        public int D20AttackSuccessCount { get; set; }
        public float D20AttackAverage { get; set; }
        public float DamageAverage { get; set; }

        public CombinedStats ToCombinedStats() => new CombinedStats
        {
            Skill = new SkillStats
            {
                Average = D20SkillAverage,
                SuccessRate = (D20SkillCount > 0) ? D20SkillSuccessCount / D20SkillCount : 0,
                CriticalSuccessRate = (D20SkillCount > 0) ? D20SkillCritSuccessCount / D20SkillCount : 0,
                CriticalFailureRate = 0
            },
            Damage = new DamageStats
            {
                Average = DamageAverage,
                SuccessRate = (D20AttackSuccessCount > 0) ? D20AttackSuccessCount / D20AttackCount : 0
            }
        };
    }

}
