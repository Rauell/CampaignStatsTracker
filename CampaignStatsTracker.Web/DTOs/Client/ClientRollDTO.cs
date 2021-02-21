using System;
using System.Collections.Generic;
using System.Linq;
using CampaignStatsTracker.DTOs.Repository;
using CampaignStatsTracker.Web.Extensions;

namespace CampaignStatsTracker.DTOs.Client
{
    public class ClientRollDTO
    {
        public IEnumerable<Guid> AssociatedEntities { get; set; }
        public string DamageType { get; set; }
        public int Modifier { get; set; }
        public int Rank { get; set; }
        public Nullable<bool> RollSuccess { get; set; }
        public int RollValue { get; set; }
        public IEnumerable<MultiDieRollValues> RollValues { get; set; }
        public string SkillType { get; set; }

        public Object AsRepositoryAttackRoll()
        {
            var die = new RepositoryDieRollTable.Row
            {
                NumberOfSides = 20,
                Value = RollValue
            };

            var modifier = new RepositoryRollModifierTable.Row
            {
                Value = Modifier
            };

            var entities = new RepositoryEntityTable
            {
                Rows = AssociatedEntities.Select(a => new RepositoryEntity { PublicId = a })
            };

            return new
            {
                Dice = die.AsTableValuedParameter(),
                Modifiers = modifier.AsTableValuedParameter(),
                SkillType = SkillType,
                Hit = RollSuccess,
                Comments = (new RepositoryRollCommentTable()).AsTableValuedParameter(),
                AssociatedEntities = entities.AsTableValuedParameter()
            };
        }

        public Object AsRepositorySkillRoll()
        {
            var die = new RepositoryDieRollTable.Row
            {
                NumberOfSides = 20,
                Value = RollValue
            };

            var modifier = new RepositoryRollModifierTable.Row
            {
                Value = Modifier
            };

            var entities = new RepositoryEntityTable
            {
                Rows = AssociatedEntities.Select(a => new RepositoryEntity { PublicId = a })
            };

            return new
            {
                Dice = die.AsTableValuedParameter(),
                Modifiers = modifier.AsTableValuedParameter(),
                SkillType = SkillType,
                Success = RollSuccess,
                Comments = (new RepositoryRollCommentTable()).AsTableValuedParameter(),
                AssociatedEntities = entities.AsTableValuedParameter()
            };
        }

        public Object AsRepositoryInitiatveRoll()
        {
            var die = new RepositoryDieRollTable.Row
            {
                NumberOfSides = 20,
                Value = RollValue
            };

            var modifier = new RepositoryRollModifierTable.Row
            {
                Value = Modifier
            };

            var entities = new RepositoryEntityTable
            {
                Rows = AssociatedEntities.Select(a => new RepositoryEntity { PublicId = a })
            };

            return new
            {
                Dice = die.AsTableValuedParameter(),
                Modifiers = modifier.AsTableValuedParameter(),
                Rank = Rank,
                Comments = (new RepositoryRollCommentTable()).AsTableValuedParameter(),
                AssociatedEntities = entities.AsTableValuedParameter()
            };
        }

        public Object AsRepositoryDamageRoll()
        {
            var dice = new RepositoryDieRollTable
            {
                Rows = RollValues.Select(
                    s => s.Values.Select(
                        v => new RepositoryDieRollTable.Row
                        {
                            NumberOfSides = s.DieType,
                            Value = v
                        }
                    )
                ).SelectMany(s => s)
            };

            var modifier = new RepositoryRollModifierTable.Row
            {
                Value = Modifier
            };

            var entities = new RepositoryEntityTable
            {
                Rows = AssociatedEntities.Select(a => new RepositoryEntity { PublicId = a })
            };

            return new
            {
                Dice = dice.AsTableValuedParameter(),
                Modifiers = modifier.AsTableValuedParameter(),
                DamageType = DamageType,
                DamageSource = "",
                Comments = (new RepositoryRollCommentTable()).AsTableValuedParameter(),
                AssociatedEntities = entities.AsTableValuedParameter()
            };
        }
    }
}