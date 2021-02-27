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

        private static RepositoryRollModifier ModifierFromClientDto(ClientRollDTO roll) =>
            new RepositoryRollModifier { Value = roll.Modifier };

        private static RepositoryRollCommentTable RollCommentsFromClientDto(ClientRollDTO roll) =>
            new RepositoryRollCommentTable();

        public RepositoryDtoMappingProfile()
        {
            CreateMap<ClientRollDTO, AttackRollRepositoryDto>()
                .ForMember(dest => dest.Dice,
                    opts => opts.MapFrom(src => SingleDieRollFromClientDto(src, 20).AsTableValuedParameter()))
                .ForMember(dest => dest.Modifiers,
                    opts => opts.MapFrom(src => ModifierFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.AssociatedEntities,
                    opts => opts.MapFrom(src => EntitiesFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.Hit, opts => opts.MapFrom(src => src.RollSuccess))
                .ForMember(dest => dest.Comments,
                    opts => opts.MapFrom(src => RollCommentsFromClientDto(src).AsTableValuedParameter()))
                ;

            CreateMap<ClientRollDTO, SkillRollRepositoryDto>()
                .ForMember(dest => dest.Dice,
                    opts => opts.MapFrom(src => SingleDieRollFromClientDto(src, 20).AsTableValuedParameter()))
                .ForMember(dest => dest.Modifiers,
                    opts => opts.MapFrom(src => ModifierFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.AssociatedEntities,
                    opts => opts.MapFrom(src => EntitiesFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.Success, opts => opts.MapFrom(src => src.RollSuccess))
                .ForMember(dest => dest.Comments,
                    opts => opts.MapFrom(src => RollCommentsFromClientDto(src).AsTableValuedParameter()))
                ;

            CreateMap<ClientRollDTO, InitiativeRollRepositoryDto>()
                .ForMember(dest => dest.Rank, opts => opts.MapFrom(src => src.Rank))
                .ForMember(dest => dest.Dice,
                    opts => opts.MapFrom(src => SingleDieRollFromClientDto(src, 20).AsTableValuedParameter()))
                .ForMember(dest => dest.Modifiers,
                    opts => opts.MapFrom(src => ModifierFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.AssociatedEntities,
                    opts => opts.MapFrom(src => EntitiesFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.Comments,
                    opts => opts.MapFrom(src => RollCommentsFromClientDto(src).AsTableValuedParameter()))
                ;

            CreateMap<ClientRollDTO, DamageRollRepositoryDto>()
                .ForMember(dest => dest.DamageType, opts => opts.MapFrom(src => src.DamageType))
                .ForMember(dest => dest.Dice,
                    opts => opts.MapFrom(src => SingleDieRollFromClientDto(src, 20).AsTableValuedParameter()))
                .ForMember(dest => dest.Modifiers,
                    opts => opts.MapFrom(src => ModifierFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.AssociatedEntities,
                    opts => opts.MapFrom(src => EntitiesFromClientDto(src).AsTableValuedParameter()))
                .ForMember(dest => dest.Comments,
                    opts => opts.MapFrom(src => RollCommentsFromClientDto(src).AsTableValuedParameter()))
                ;
        }
    }
}