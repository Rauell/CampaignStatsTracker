using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    internal sealed class RepositoryRollModifierTable : RepositoryTable<RepositoryRollModifier>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[RollModifierType]",
            ColumnNames = new string[] { "Value" }
        };

        public RepositoryRollModifierTable() : base(_metaData) { }
    }
}