namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryEntityTable : RepositoryTable<RepositoryEntity>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Entities].[EntitiesType]",
            ColumnNames = new string[] { "PublicId" }
        };

        public RepositoryEntityTable() : base(_metaData) { }
    }
}