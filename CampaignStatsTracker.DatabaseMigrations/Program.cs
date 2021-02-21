using System;
using System.IO;
using System.Threading;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Configuration;
using CampaignStatsTracker.DatabaseMigrations.Configurations;
using CampaignStatsTracker.DatabaseMigrations.Services;

namespace CampaignStatsTracker.DatabaseMigrations
{
    class Program
    {
        static private readonly DatabaseMigrationConfiguration _configuration = new DatabaseMigrationConfiguration();

        //* Adapated from https://dasith.me/2020/06/08/database-project-conversion-to-migrations/
        static int Main(string[] args)
        {
            // Configuration
            var configBuilder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
#if DEBUG
                .AddJsonFile("appsettings.Debug.json")
#endif
                .AddEnvironmentVariables();
            var configuration = configBuilder.Build();
            configuration.Bind(_configuration);

            var serviceProvider = new ServiceCollection()
                .AddLogging(opt =>
                {
                    opt
                        .SetMinimumLevel(LogLevel.Debug)
                        .AddConsole();
                })
                .AddSingleton(_configuration)
                .AddSingleton<IMigrationService, MigrationService>()
                .BuildServiceProvider();


            var logger = serviceProvider.GetService<ILoggerFactory>()
                .CreateLogger<Program>();
            logger.LogDebug("Starting application");
            // var bar = serviceProvider.GetService<IMigrationService>();

            serviceProvider.GetService<IMigrationService>()
                .ApplyMigrations();
            // bar.DoSomeRealWork();

            logger.LogDebug("All done!");

            Thread.Sleep(500);

            return 0;
        }

        // static int aMain(string[] args)
        // {
        //     var noWait = false;

        //     if (args.Length == 1 && args[0] == "--nowait")
        //     {
        //         noWait = true;
        //     }

        //     int exitCode = 0;

        //     try
        //     {
        //         WriteToConsole($"Database Migration Runner. " +
        //         $"Version={typeof(IEnvironmentsFolderMarker).Assembly.GetName().Version}");

        //         // NOTE: PLEASE MAKE SURE YOUR SCRIPT IS MARKED AS EMBEDDED
        //         // https://www.c-sharpcorner.com/uploadfile/40e97e/saving-an-embedded-file-in-C-Sharp/
        //         // WriteToConsole("\nIMPORTANT: Please ensure your scripts are EMBEDDED in the executable.");

        //         var baseNamespace = typeof(Program).Namespace;
        //         var baseEnvironmentsNamespace = typeof(IEnvironmentsFolderMarker).Namespace;

        //         // You can use IConfiguration (Microsoft.Extensions.Configuration) to
        //         // achieve the same thing in a .NET Core project as shown here
        //         // https://stackoverflow.com/questions/38114761/asp-net-core-configuration-for-net-core-console-application

        //         // var additionalPreDeploymentNamespace =
        //         //     ConfigurationManager.AppSettings["AdditionalPreDeploymentNamespace"];
        //         // var additionalPostDeploymentNamespace =
        //         //     ConfigurationManager.AppSettings["AdditionalPostDeploymentNamespace"];
        //         // var connectionString =
        //         //     ConfigurationManager.ConnectionStrings["MyConnectionString"];

        //         var builder = new ConfigurationBuilder()
        //             .AddJsonFile("appsettings.json", true)
        //             .AddCommandLine(args);

        //         WriteToConsole("\nListing variables...\n");
        //         var variables = new Dictionary<string, string>();

        //         foreach (var k in ConfigurationManager.AppSettings.AllKeys)
        //         {
        //             variables.Add(k, ConfigurationManager.AppSettings[k]);
        //             WriteToConsole($"${k}$ = \"{ConfigurationManager.AppSettings[k]}\"");
        //             // See how to use variables in your scripts:
        //             // https://dbup.readthedocs.io/en/latest/more-info/variable-substitution/
        //         }

        //         if (!string.IsNullOrWhiteSpace(additionalPreDeploymentNamespace))
        //         {
        //             additionalPreDeploymentNamespace = baseEnvironmentsNamespace +
        //                 "." + additionalPreDeploymentNamespace;
        //         }

        //         if (!string.IsNullOrWhiteSpace(additionalPostDeploymentNamespace))
        //         {
        //             additionalPostDeploymentNamespace = baseEnvironmentsNamespace +
        //                 "." + additionalPostDeploymentNamespace;
        //         }

        //         if (!noWait)
        //         {
        //             Console.Write("\nPress return to run scripts...");
        //             Console.ReadLine();
        //         }

        //         // Pre deployments
        //         WriteToConsole("Start executing predeployment scripts...");
        //         string preDeploymentScriptsPath = baseNamespace + ".PreDeployment";
        //         RunMigrations(connectionString,
        //             preDeploymentScriptsPath, variables, true);

        //         if (!string.IsNullOrWhiteSpace(additionalPreDeploymentNamespace))
        //         {
        //             RunMigrations(connectionString,
        //                 additionalPreDeploymentNamespace, variables, true);
        //         }

        //         // Migrations
        //         WriteToConsole("Start executing migration scripts...");
        //         var migrationScriptsPath = baseNamespace + ".Migrations";
        //         RunMigrations(connectionString,
        //             migrationScriptsPath, variables, false);

        //         // Post deployments
        //         WriteToConsole("Start executing postdeployment scripts...");
        //         string postdeploymentScriptsPath = baseNamespace + ".PostDeployment";
        //         RunMigrations(connectionString,
        //             postdeploymentScriptsPath, variables, true);

        //         if (!string.IsNullOrWhiteSpace(additionalPostDeploymentNamespace))
        //         {
        //             RunMigrations(connectionString,
        //                 additionalPostDeploymentNamespace, variables, true);
        //         }
        //     }
        //     catch (Exception e)
        //     {
        //         WriteToConsole(e.Message, ConsoleColor.Red);

        //         exitCode = -1;
        //     }

        //     if (!noWait)
        //     {
        //         Console.Write("Press return key to exit...");
        //         Console.ResetColor();
        //         Console.ReadKey();
        //     }

        //     return exitCode;
        // }

        // private static int RunMigrations(string connectionString,
        //     string @namespace,
        //     Dictionary<string, string> variables,
        //     bool alwaysRun = false)
        // {
        //     WriteToConsole($"Executing scripts in {@namespace}");

        //     var builder = DeployChanges.To
        //         .SqlDatabase(connectionString)
        //         .WithVariables(variables)
        //         .WithScriptsEmbeddedInAssembly(
        //             Assembly.GetExecutingAssembly(), file =>
        //         {
        //             return file
        //                 .ToLower()
        //                 .StartsWith(@namespace.ToLower());
        //         })
        //         .LogToConsole();

        //     builder = alwaysRun ?
        //         builder.JournalTo(new NullJournal()) :
        //         builder.JournalToSqlTable("dbo", "DatabaseMigrations");

        //     var executor = builder.Build();
        //     var result = executor.PerformUpgrade();

        //     if (!result.Successful)
        //     {
        //         throw new Exception(result.Error.ToString());
        //     }

        //     ShowSuccess();
        //     return 0;
        // }

        // private static void ShowSuccess()
        // {
        //     WriteToConsole("Success!", ConsoleColor.Green);
        // }

        // private static void WriteToConsole(string msg,
        //     ConsoleColor color = ConsoleColor.Green)
        // {
        //     Console.ForegroundColor = color;
        //     Console.WriteLine(msg);
        //     Console.ResetColor();
        // }
    }
}
