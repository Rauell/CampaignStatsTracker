using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    internal sealed class RepositoryRollModifier : RepositoryRow<RepositoryRollModifier, RepositoryRollModifierTable>
    {
        public int Value { get; set; }
    }
}