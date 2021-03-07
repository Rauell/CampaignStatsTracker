using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class MiscellaneousRollRepositoy : IMiscellaneousRollRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public MiscellaneousRollRepositoy(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync<MiscellaneousRollRepositoyDto>("[Rolls].[Sto_InsertMiscellaneousRoll]", roll);
    }
}