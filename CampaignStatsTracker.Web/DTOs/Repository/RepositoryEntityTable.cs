using System;
using System.Collections.Generic;
using Dapper;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public class RepositoryEntityTable
    {
        public IEnumerable<RepositoryEntity> Rows { get; set; }

        private static readonly string _typeName = "[Entities].[EntitiesType]";
        private static readonly IEnumerable<string> _columnNames = new string[]
        {
            "PublicId"
        };

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter()
        {
            return Rows.AsTableValuedParameter(_typeName, _columnNames);
        }
    }
}