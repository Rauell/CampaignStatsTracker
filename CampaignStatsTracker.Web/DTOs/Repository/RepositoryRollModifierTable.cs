using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryRollModifierTable : RepositoryTable<RepositoryRollModifier>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[RollModifierType]",
            ColumnNames = new string[] { "Value" }
        };

        public RepositoryRollModifierTable() : base(_metaData) { }
    }
}