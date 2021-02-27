using System.Threading.Tasks;
using CampaignStatsTracker.DTOs.Client;

namespace CampaignStatsTracker.Web.Features.Rolls.Repositories
{
    internal sealed class SkillRollRepository : ISkillRollRepository
    {
        private readonly IRollRepositoryUtility _utility;

        public SkillRollRepository(IRollRepositoryUtility utility)
        {
            _utility = utility;
        }

        public async Task InsertRollAsync(ClientRollDTO roll) =>
            await _utility.InsertRollAsync("[Rolls].[Sto_InsertSkillRoll]", roll.AsRepositorySkillRoll());
    }
}