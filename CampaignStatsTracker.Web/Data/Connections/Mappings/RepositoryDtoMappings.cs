using System.Linq;
using AutoMapper;
using CampaignStatsTracker.DTOs.Client;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos;
using CampaignStatsTracker.Web.Features.Rolls.Repositories.Dtos.Abstractions;

namespace CampaignStatsTracker.Web.Data.Mappings
{
    public class RepositoryDtoMappingProfile : Profile
    {
        private static RepositoryEntityTable EntitiesFromClientDto(ClientRollDTO roll) =>
            new RepositoryEntityTable
            {
                Rows = roll.AssociatedEntities.Select(a => new RepositoryEntity { PublicId = a })
            };

        private static RepositoryDieRoll SingleDieRollFromClientDto(ClientRollDTO roll, int sides) =>
            new RepositoryDieRoll
            {
                NumberOfSides = sides,
                Value = roll.RollValue
            };

        private static RepositoryDieRollTable MultiDiceFromClientDto(ClientRollDTO roll) =>
            new RepositoryDieRollTable
            {
                Rows = roll.RollValues.Select(typeGroup =>
                    typeGroup.Values.Select(v =>
                        new RepositoryDieRoll
                        {
                            NumberOfSides = typeGroup.DieType,
                            Value = v
                        }))
                    .SelectMany(s => s)
            };

        private static RepositoryRollModifier ModifierFromClientDto(ClientRollDTO roll) =>
            new RepositoryRollModifier { Value = roll.Modifier };

        private static RepositoryRollCommentTable RollCommentsFromClientDto(ClientRollDTO roll) =>
            new RepositoryRollCommentTable();

        private IMappingExpression<ClientRollDTO, T> CreateMapBase<T>() where T : BaseRollRepositoryDto =>
            CreateMap<ClientRollDTO, T>()
                .ForMember(dest => dest.Modifiers,
                    opts => opts.MapFrom(src => ModifierFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.AssociatedEntities,
                    opts => opts.MapFrom(src => EntitiesFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.Comments,
                    opts => opts.MapFrom(src => RollCommentsFromClientDto(src).AsTableValuedParameter()));

        private IMappingExpression<ClientRollDTO, T> CreateMapSingleDie<T>(int sides) where T : BaseRollRepositoryDto =>
            CreateMapBase<T>()
                .ForMember(dest => dest.Dice,
                    opts => opts.MapFrom(src => SingleDieRollFromClientDto(src, sides).AsTableValuedParameter()));

        public RepositoryDtoMappingProfile()
        {
            CreateMapSingleDie<AttackRollRepositoryDto>(20)
                .ForMember(dest => dest.Hit, opts => opts.MapFrom(src => src.RollSuccess));

            CreateMapSingleDie<SkillRollRepositoryDto>(20)
                .ForMember(dest => dest.Success, opts => opts.MapFrom(src => src.RollSuccess));

            CreateMapSingleDie<InitiativeRollRepositoryDto>(20)
                .ForMember(dest => dest.Rank, opts => opts.MapFrom(src => src.Rank));

            CreateMapBase<DamageRollRepositoryDto>()
                .ForMember(dest => dest.Dice, opts => opts.MapFrom(src => MultiDiceFromClientDto(src).AsTableValuedParameter()));
        }
    }
}