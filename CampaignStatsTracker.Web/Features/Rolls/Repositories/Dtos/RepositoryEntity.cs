using System;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos
{
    internal sealed class RepositoryEntity : RepositoryRow<RepositoryEntity, RepositoryEntityTable>
    {
        public Guid PublicId { get; set; }
    }
}