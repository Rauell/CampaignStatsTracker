using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    internal sealed class RepositoryRollComment : RepositoryRow<RepositoryRollComment, RepositoryRollCommentTable>
    {
        public string Comment { get; set; }
    }
}