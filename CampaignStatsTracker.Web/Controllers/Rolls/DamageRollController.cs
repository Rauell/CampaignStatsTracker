using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [ApiExplorerSettings(GroupName = "Rolls")]
    [Route("api/roll/damage")]
    public class DamageRollController : ControllerBase
    {
        private readonly IDamageRollRepository _repository;

        public DamageRollController(IDamageRollRepository repository)
        {
            _repository = repository;
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] ClientRollDTO roll)
        {
            await _repository.InsertRollAsync(roll);
            return Ok();
        }
    }
}
