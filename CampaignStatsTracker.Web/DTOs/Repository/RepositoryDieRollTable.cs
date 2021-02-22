using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryDieRollTable : RepositoryTable<RepositoryDieRoll>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[DieRollType]",
            ColumnNames = new string[] { "NumberOfSides", "Value" }
        };

        public RepositoryDieRollTable() : base(_metaData) { }
    }
}