using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class InitiativeRollRepository : IInitiativeRollRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public InitiativeRollRepository(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync<InitiativeRollRepositoryDto>("[Rolls].[Sto_InsertInitiativeRoll]", roll);
    }
}