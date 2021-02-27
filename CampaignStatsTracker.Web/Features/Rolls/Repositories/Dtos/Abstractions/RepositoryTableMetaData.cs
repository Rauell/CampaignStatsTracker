using System.Collections.Generic;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions
{
    internal class RepositoryTableMetaData
    {
        public string TypeName { get; set; }
        public IEnumerable<string> ColumnNames { get; set; }
    }
}