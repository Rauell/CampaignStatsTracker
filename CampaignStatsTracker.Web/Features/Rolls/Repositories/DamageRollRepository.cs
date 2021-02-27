using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class DamageRollRepository : IDamageRollRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public DamageRollRepository(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync<DamageRollRepositoryDto>("[Rolls].[Sto_InsertDamageRoll]", roll);
    }
}