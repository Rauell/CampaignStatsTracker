using System.Collections.Generic;
using Dapper;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal abstract class RepositoryRow<Row, Table>
        where Row : class
        where Table : RepositoryTable<Row>, new()
    {
        public IEnumerable<Row> ToList() => new List<Row> { this as Row };

        public Table ToTable() => new Table { Rows = ToList() };

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter() => ToTable().AsTableValuedParameter();
    }
}