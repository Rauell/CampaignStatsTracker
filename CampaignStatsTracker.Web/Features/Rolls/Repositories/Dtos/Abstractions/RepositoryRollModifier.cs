namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryRollModifier : RepositoryRow<RepositoryRollModifier, RepositoryRollModifierTable>
    {
        public int Value { get; set; }
    }
}