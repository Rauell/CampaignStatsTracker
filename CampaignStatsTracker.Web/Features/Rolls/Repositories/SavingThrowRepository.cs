using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class SavingThrowRepository : ISavingThrowRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public SavingThrowRepository(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync<SavingThrowRepositoryDto>("[Rolls].[Sto_InsertSavingThrow]", roll);
    }
}