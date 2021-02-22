using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryEntityTable : RepositoryTable<RepositoryEntity>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Entities].[EntitiesType]",
            ColumnNames = new string[] { "PublicId" }
        };

        public RepositoryEntityTable() : base(_metaData) { }
    }
}