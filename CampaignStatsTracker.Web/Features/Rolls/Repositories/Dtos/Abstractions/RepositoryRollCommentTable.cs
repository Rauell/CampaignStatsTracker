namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryRollCommentTable : RepositoryTable<RepositoryRollComment>
    {
        private static readonly RepositoryTableMetaData _metaData = new RepositoryTableMetaData
        {
            TypeName = "[Rolls].[RollCommentType]",
            ColumnNames = new string[] { "Comment" }
        };

        public RepositoryRollCommentTable() : base(_metaData) { }
    }
}