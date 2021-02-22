using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryRollComment : RepositoryRow<RepositoryRollComment, RepositoryRollCommentTable>
    {
        public string Comment { get; set; }
    }
}