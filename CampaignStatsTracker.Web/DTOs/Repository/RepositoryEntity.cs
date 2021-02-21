using System;
using System.Collections.Generic;
using Dapper;

namespace CampaignStatsTracker.DTOs.Repository
{
    public class RepositoryEntity
    {
        public Guid PublicId { get; set; }

        public RepositoryEntityTable ToTable()
        {
            return new RepositoryEntityTable
            {
                Rows = new List<RepositoryEntity> { this }
            };
        }

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter() =>
            ToTable().AsTableValuedParameter();
    }
}