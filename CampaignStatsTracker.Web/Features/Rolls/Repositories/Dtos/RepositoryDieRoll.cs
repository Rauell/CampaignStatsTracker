using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    internal sealed class RepositoryDieRoll : RepositoryRow<RepositoryDieRoll, RepositoryDieRollTable>
    {
        public int NumberOfSides { get; set; }
        public int Value { get; set; }
    }
}