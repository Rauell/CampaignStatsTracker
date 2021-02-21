using System.Collections.Generic;

namespace CampaignStatsTracker.DatabaseMigrations.Configurations
{
    public class MigrationNamespaceConfiguration
    {
        public string Base { get; set; }
        public IEnumerable<MigrationDirectoryConfiguration> PreDeploy { get; set; }
        public IEnumerable<MigrationDirectoryConfiguration> Main { get; set; }
        public IEnumerable<MigrationDirectoryConfiguration> PostDeploy { get; set; }
    }
}