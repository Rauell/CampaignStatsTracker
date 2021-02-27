namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryRollComment : RepositoryRow<RepositoryRollComment, RepositoryRollCommentTable>
    {
        public string Comment { get; set; }
    }
}