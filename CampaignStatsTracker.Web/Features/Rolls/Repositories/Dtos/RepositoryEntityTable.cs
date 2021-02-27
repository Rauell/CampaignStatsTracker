using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
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