using System.Collections.Generic;
using Dapper;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public class RepositoryDieRollTable
    {
        public class Row
        {
            public int NumberOfSides { get; set; }
            public int Value { get; set; }

            public RepositoryDieRollTable ToTable()
            {
                return new RepositoryDieRollTable
                {
                    Rows = new List<RepositoryDieRollTable.Row> { this }
                };
            }

            public SqlMapper.ICustomQueryParameter AsTableValuedParameter() =>
                ToTable().AsTableValuedParameter();
        }

        public IEnumerable<RepositoryDieRollTable.Row> Rows { get; set; }

        private static readonly string _typeName = "[Rolls].[DieRollType]";
        private static readonly IEnumerable<string> _columnNames = new string[]
        {
            "NumberOfSides",
            "Value"
        };

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter()
        {
            return Rows.AsTableValuedParameter(_typeName, _columnNames);
        }
    }
}