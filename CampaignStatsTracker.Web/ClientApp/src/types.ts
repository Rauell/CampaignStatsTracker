/* Begin Section Common */
export interface IPublicEntity {
  publicId: string;
  dateCreated: string;
}

interface INamedPublicEntity extends IPublicEntity {
  name: string;
}
/* End Secion Common */

/* Begin Section Rolls */
export const defaultMaxDieRoll = 20;

export interface IRoll extends IPublicEntity {
  value: number;
  modifier: number;
  rollType: string;
}
/* End Section Rolls */

/* Section Stats */
export interface IStatSkill {
  average: number;
  // typeMode: string;
  successRate: number;
  criticalSuccessRate: number;
  criticalFailureRate: number;
}

export interface IStatDamage {
  average: number;
  // attackMode: string;
  successRate: number;
}

export interface ICombinedStats {
  skill: IStatSkill;
  damage: IStatDamage;
}

export interface IPublicEntityStats extends IPublicEntity {
  stats: ICombinedStats;
  latestRolls: IRoll[];
}

export interface INamedPublicEntityStats extends IPublicEntityStats {
  name: string;
}

/* End Section Stats */

/* Begin Section Users */
export interface IUser extends INamedPublicEntity { }

export interface IUserStats extends IUser, IPublicEntityStats { }
/* End Section Users */

/* Begin Section Campaigns */
export interface ICampaign extends INamedPublicEntity { }

export interface ICampaignStats extends ICampaign, IPublicEntityStats {
  characters: IUserStats[];
}
/* End Section Campaigns */