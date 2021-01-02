using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.Database;
using CampaignStatsTracker.Models.Views.Entities;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class CampaignController : ControllerBase
    {
        [HttpGet]
        [Route("list")]
        public async Task<ActionResult<IEnumerable<Campaign>>> Get()
        {
            var db = new CampaignDatabase();
            var campaigns = await db.GetCampaigns();
            return campaigns.ToList();
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Campaign>> Get(Guid Id)
        {
            var db = new CampaignDatabase();
            var result = await db.GetCampaignStatsById(Id);

            if (result is null)
            {
                return NotFound();
            }

            return result;
        }
    }
}
