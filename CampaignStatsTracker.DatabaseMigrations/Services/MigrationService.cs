using System;
using System.Reflection;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Extensions.Logging;
using DbUp;
using DbUp.Helpers;
using System.Data.SqlClient;
using CampaignStatsTracker.DatabaseMigrations.Configurations;

namespace CampaignStatsTracker.DatabaseMigrations.Services
{
    public class MigrationService : IMigrationService
    {
        private readonly ILogger _logger;
        private readonly DatabaseMigrationConfiguration _config;
        private readonly SqlConnectionStringBuilder _connectionBuilder;

        public MigrationService(ILogger<MigrationService> logger, DatabaseMigrationConfiguration config)
        {
            _logger = logger;
            _config = config;
            _connectionBuilder = new SqlConnectionStringBuilder(_config.ConnectionString);

            _logger.LogDebug("Migration service created");
        }

        public void ApplyMigrations()
        {

            _logger.LogInformation("Beginning migrations");

#if DEBUG
            if (_config.RecreateDatabase)
            {
                DropDatabase.For.SqlDatabase(_connectionBuilder.ConnectionString);
            }
#endif

            EnsureDatabase.For.SqlDatabase(_connectionBuilder.ConnectionString);

            RunMigrations(_config.MigrationNamespace.PreDeploy);
            RunMigrations(_config.MigrationNamespace.Main);
            RunMigrations(_config.MigrationNamespace.PostDeploy);

            _logger.LogInformation("Migrations Complete");
        }

        private void RunMigrations(IEnumerable<MigrationDirectoryConfiguration> configurations)
        {
            foreach (var config in configurations)
            {
                _logger.LogInformation($"Running migrations for {config.Directory}");

                var newNamespace = config.Directory;

                if (!string.IsNullOrWhiteSpace(_config.MigrationNamespace.Base))
                {
                    newNamespace = $"{_config.MigrationNamespace.Base}.{newNamespace}";
                }

                newNamespace = newNamespace.Replace('/', '.').ToLower();

                var builder = DeployChanges.To
                    .SqlDatabase(_connectionBuilder.ConnectionString)
                    .WithVariable("DatabaseName", _connectionBuilder.InitialCatalog)
                    .WithScriptsEmbeddedInAssembly(
                        Assembly.GetExecutingAssembly(),
                        file => file.ToLower().StartsWith(newNamespace)
                    )
                    .LogToConsole()
                    .LogScriptOutput();

                if (config.Idempotent)
                {
                    builder.JournalTo(new NullJournal());
                }

                var executor = builder.Build();

                if (executor.IsUpgradeRequired())
                {
                    var result = executor.PerformUpgrade();

                    if (!result.Successful)
                    {
                        throw new Exception(result.Error.ToString());
                    }
                }

            }
        }
    }
}