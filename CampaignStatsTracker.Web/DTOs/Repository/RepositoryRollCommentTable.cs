using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryRollCommentTable : RepositoryTable<RepositoryRollComment>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[RollCommentType]",
            ColumnNames = new string[] { "Comment" }
        };

        public RepositoryRollCommentTable() : base(_metaData) { }
    }
}