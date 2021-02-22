using System;
using CampaignStatsTracker.DTOs.Repository.Abstractions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public sealed class RepositoryEntity : RepositoryRow<RepositoryEntity, RepositoryEntityTable>
    {
        public Guid PublicId { get; set; }
    }
}