using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories;

namespace CampaignStatsTracker.Web.Controllers
{
    [ApiController]
    [ApiExplorerSettings(GroupName = "Rolls")]
    [Route("api/roll/attack")]
    public class AttackRollController : ControllerBase
    {
        private readonly IAttackRollRepository _repository;

        public AttackRollController(IAttackRollRepository repository)
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
