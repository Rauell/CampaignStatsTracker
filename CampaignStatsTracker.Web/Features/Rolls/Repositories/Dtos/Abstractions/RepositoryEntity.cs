using System;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal sealed class RepositoryEntity : RepositoryRow<RepositoryEntity, RepositoryEntityTable>
    {
        public Guid PublicId { get; set; }
    }
}