using Dapper;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class DamageRollRepositoryDto
    {
        public string DamageType { get; set; }
        public string DamageSource { get; set; }
        public SqlMapper.ICustomQueryParameter Dice { get; set; }
        public SqlMapper.ICustomQueryParameter Modifiers { get; set; }
        public SqlMapper.ICustomQueryParameter Comments { get; set; }
        public SqlMapper.ICustomQueryParameter AssociatedEntities { get; set; }
    }
}