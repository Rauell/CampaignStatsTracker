using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryDieRoll : RepositoryRow<RepositoryDieRoll, RepositoryDieRollTable>
    {
        public int NumberOfSides { get; set; }
        public int Value { get; set; }
    }
}