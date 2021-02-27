using System.Collections.Generic;
using Dapper;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal abstract class RepositoryTable<T>
    {
        private RepositoryTableMetaData _metaData;

        public RepositoryTable(RepositoryTableMetaData metaData)
        {
            _metaData = metaData;
        }

        public IEnumerable<T> Rows { get; set; } = new List<T>();

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter()
        {
            return Rows.AsTableValuedParameter(_metaData.TypeName, _metaData.ColumnNames);
        }
    }
}