using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.Database;
using CampaignStatsTracker.Models.Views;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RollController : ControllerBase
    {
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] RollPost roll)
        {
            var db = new CampaignDatabase();
            await db.InsertRoll(roll);
            return Ok();
        }
    }
}
