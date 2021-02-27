using System;
using System.Collections.Generic;

namespace CampaignStatsTracker.DTOs.Client
{
    public class ClientRollDTO
    {
        public IEnumerable<Guid> AssociatedEntities { get; set; }
        public string DamageType { get; set; }
        public int Modifier { get; set; }
        public int Rank { get; set; }
        public Nullable<bool> RollSuccess { get; set; }
        public int RollValue { get; set; }
        public IEnumerable<MultiDieRollValues> RollValues { get; set; }
        public string SkillType { get; set; }
    }
}