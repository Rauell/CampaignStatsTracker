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

        [HttpPost]
        public async Task<ActionResult> Attack([FromBody] ClientRollDTO roll)
        {
            await _database.InsertAttackRollAsync(roll);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult> Skill([FromBody] ClientRollDTO roll)
        {
            await _database.InsertSkillRollAsync(roll);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult> Damage([FromBody] ClientRollDTO roll)
        {
            await _database.InsertDamageRollAsync(roll);
            return Ok();
        }

        [HttpPost]
        public async Task<ActionResult> Initiative([FromBody] ClientRollDTO roll)
        {
            await _database.InsertInitiativeRollAsync(roll);
            return Ok();
        }
    }
}
