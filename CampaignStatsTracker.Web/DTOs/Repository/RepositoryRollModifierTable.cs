using System.Collections.Generic;
using Dapper;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public class RepositoryRollModifierTable
    {
        public class Row
        {
            public int Value { get; set; }

            public RepositoryRollModifierTable ToTable()
            {
                return new RepositoryRollModifierTable
                {
                    Rows = new List<RepositoryRollModifierTable.Row> { this }
                };
            }

            public SqlMapper.ICustomQueryParameter AsTableValuedParameter() =>
                ToTable().AsTableValuedParameter();
        }

        public IEnumerable<RepositoryRollModifierTable.Row> Rows { get; set; }

        private static readonly string _typeName = "[Rolls].[RollModifierType]";
        private static readonly IEnumerable<string> _columnNames = new string[]
        {
            "Value"
        };

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter()
        {
            return Rows.AsTableValuedParameter(_typeName, _columnNames);
        }
    }
}