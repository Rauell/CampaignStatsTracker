namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryDieRollTable : RepositoryTable<RepositoryDieRoll>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[DieRollType]",
            ColumnNames = new string[] { "NumberOfSides", "Value" }
        };

        public RepositoryDieRollTable() : base(_metaData) { }
    }
}