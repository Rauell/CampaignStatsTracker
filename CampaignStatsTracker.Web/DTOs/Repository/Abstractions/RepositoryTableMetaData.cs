using System.Collections.Generic;

namespace CampaignStatsTracker.DTOs.Repository.Abstractions
{
    public class RepositoryTableMetaData
    {
        public string TypeName { get; set; }
        public IEnumerable<string> ColumnNames { get; set; }
    }
}