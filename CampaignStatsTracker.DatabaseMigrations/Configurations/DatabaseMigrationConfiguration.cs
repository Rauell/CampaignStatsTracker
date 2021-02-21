namespace CampaignStatsTracker.DatabaseMigrations.Configurations
{
    public class DatabaseMigrationConfiguration
    {
        public string ConnectionString { get; set; }
        public MigrationNamespaceConfiguration MigrationNamespace { get; set; }
        public bool RecreateDatabase { get; set; }
    }
}