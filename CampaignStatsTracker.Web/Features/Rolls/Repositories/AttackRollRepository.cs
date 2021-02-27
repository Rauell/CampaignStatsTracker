using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class AttackRollRepository : IAttackRollRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public AttackRollRepository(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync<AttackRollRepositoryDto>("[Rolls].[Sto_InsertAttackRoll]", roll);
    }
}