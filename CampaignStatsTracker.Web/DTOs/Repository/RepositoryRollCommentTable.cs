using System.Collections.Generic;
using Dapper;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.DTOs.Repository
{
    public class RepositoryRollCommentTable
    {
        public class Row
        {
            public string Comment { get; set; }

            public RepositoryRollCommentTable ToTable()
            {
                return new RepositoryRollCommentTable
                {
                    Rows = new List<RepositoryRollCommentTable.Row> { this }
                };
            }

            public SqlMapper.ICustomQueryParameter AsTableValuedParameter() =>
                ToTable().AsTableValuedParameter();
        }

        public IEnumerable<RepositoryRollCommentTable.Row> Rows { get; set; } = new List<RepositoryRollCommentTable.Row>();

        private static readonly string _typeName = "[Rolls].[RollCommentType]";
        private static readonly IEnumerable<string> _columnNames = new string[]
        {
            "Comment"
        };

        public SqlMapper.ICustomQueryParameter AsTableValuedParameter()
        {
            return Rows.AsTableValuedParameter(_typeName, _columnNames);
        }
    }
}