using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.SpaServices.ReactDevelopmentServer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using CampaignStatsTracker.Web.Data.Connections;
using CampaignStatsTracker.Web.Configurations;
using CampaignStatsTracker.Web.Features.Rolls.Repositories;
using CampaignStatsTracker.Web.Data.Mappings;

namespace CampaignStatsTracker.Web
{
    public class Startup
    {
        private CampaignTrackerConfiguration _trackerConfig = new CampaignTrackerConfiguration();

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            Configuration.Bind(_trackerConfig);
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();

            // In production, the React files will be served from this directory
            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/build";
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "CampaignStatsTracker API", Version = "v1" });

                c.TagActionsBy(api =>
                {
                    if (api.GroupName != null)
                    {
                        return new[] { api.GroupName };
                    }

                    var controllerActionDescriptor = api.ActionDescriptor as ControllerActionDescriptor;
                    if (controllerActionDescriptor != null)
                    {
                        return new[] { controllerActionDescriptor.ControllerName };
                    }

                    throw new InvalidOperationException("Unable to determine tag for endpoint.");
                });

                c.DocInclusionPredicate((name, api) => true);
            });

            services
                .AddSingleton(_trackerConfig)
                .AddSingleton<ICampaignStatsTrackerDbConnectionFactory, CampaignStatsTrackerDbConnectionFactory>()
                .AddSingleton<IRollRepositoryUtility, RollRepositoryUtility>()
                .AddSingleton<IAttackRollRepository, AttackRollRepository>()
                .AddSingleton<IDamageRollRepository, DamageRollRepository>()
                .AddSingleton<IInitiativeRollRepository, InitiativeRollRepository>()
                .AddSingleton<IMiscellaneousRollRepository, MiscellaneousRollRepositoy>()
                .AddSingleton<ISavingThrowRepository, SavingThrowRepository>()
                .AddSingleton<ISkillRollRepository, SkillRollRepository>()
            ;

            services.AddAutoMapper(typeof(RepositoryDtoMappingProfile));

            services.AddLogging(opt =>
            {
                opt.SetMinimumLevel(LogLevel.Debug)
                    .AddConsole();
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            // app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSpaStaticFiles();

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "CampaignStatsTracker V1");
            });

            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });

            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    spa.UseReactDevelopmentServer(npmScript: "start");
                }
            });
        }
    }
}
