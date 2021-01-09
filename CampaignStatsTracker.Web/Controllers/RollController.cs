using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.Database;
using CampaignStatsTracker.Models.Views;
using CampaignStatsTracker.Models.Views.Entities;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RollController : ControllerBase
    {
        [HttpPost]
        public async Task<ActionResult<IEnumerable<EntityWithStats>>> Post([FromBody] RollPost roll)
        {
            var db = new CampaignDatabase();
            await db.InsertRollAsync(roll);

            var stats = await db.GetStatsAsync(roll.Entities.Select(e => e.PublicId));
            return stats.ToList();
        }
    }
}
