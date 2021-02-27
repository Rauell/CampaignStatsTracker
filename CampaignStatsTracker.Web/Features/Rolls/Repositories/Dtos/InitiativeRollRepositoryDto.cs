using Dapper;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    public class InitiativeRollRepositoryDto
    {
        public SqlMapper.ICustomQueryParameter Dice { get; set; }
        public SqlMapper.ICustomQueryParameter Modifiers { get; set; }

        public int Rank { get; set; }
        public SqlMapper.ICustomQueryParameter Comments { get; set; }
        public SqlMapper.ICustomQueryParameter AssociatedEntities { get; set; }
    }
}