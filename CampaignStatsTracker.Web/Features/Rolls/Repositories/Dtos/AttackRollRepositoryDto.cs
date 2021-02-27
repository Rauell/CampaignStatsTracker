using System;
using Dapper;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class AttackRollRepositoryDto
    {
        public SqlMapper.ICustomQueryParameter Dice { get; set; }
        public SqlMapper.ICustomQueryParameter Modifiers { get; set; }
        public string SkillType { get; set; }
        public Nullable<bool> Hit { get; set; }
        public SqlMapper.ICustomQueryParameter Comments { get; set; }
        public SqlMapper.ICustomQueryParameter AssociatedEntities { get; set; }
    }
}