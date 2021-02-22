using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryRollModifier : RepositoryRow<RepositoryRollModifier, RepositoryRollModifierTable>
    {
        public int Value { get; set; }
    }
}