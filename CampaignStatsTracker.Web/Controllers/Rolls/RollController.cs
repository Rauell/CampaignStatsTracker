using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Database;
using CampaignStatsTracker.Models.Views;
using CampaignStatsTracker.Models.Views.Entities;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [ApiExplorerSettings(GroupName = "Rolls")]
    [Route("api/[controller]/[action]")]
    public class RollController : ControllerBase
    {
        private readonly CampaignDatabase _database;

        public RollController()
        {
            _database = new CampaignDatabase();
        }

        [HttpGet("{publicId}")]
        public async Task<RollPost> Get(Guid publicId)
        {
            return await _database.GetRollDetailsAsync(publicId);
        }
    }
}
