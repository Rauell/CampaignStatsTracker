using System.Collections.Generic;

namespace CampaignStatsTracker.DatabaseMigrations.Configurations
{
    public class MigrationDirectoryConfiguration
    {
        public string Directory { get; set; }
        public bool Idempotent { get;set; } = false;
    }
}