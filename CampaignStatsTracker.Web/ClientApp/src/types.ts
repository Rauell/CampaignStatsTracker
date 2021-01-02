import { Guid } from "guid-typescript";

/* Begin Section Common */
export interface IPublicEntity {
  publicId: Guid;
}

interface INamedPublicEntity extends IPublicEntity {
  name: string;
}
/* End Secion Common */

/* Begin Section Rolls */
export const defaultMaxDieRoll = 20;

export interface IRollComment {
  comment: string;
}

export interface IRollDamage {
  value: number;
  type?: string;
  source?: string;
  target?: string;
  comments?: IRollComment[];
}

export interface IRoll {
  type: string;
  value: number;
  damage?: IRollDamage;
  maxDieRoll?: number;
  id: string;
  comments?: IRollComment[];
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

export interface IPublicStats extends INamedPublicEntity {
  stats: ICombinedStats;
}
/* End Section Stats */

/* Begin Section Users */
export interface IUser extends INamedPublicEntity { }

export interface IUserStats extends IUser, IPublicStats { }
/* End Section Users */

/* Begin Section Campaigns */
export interface ICampaign extends INamedPublicEntity { }

export interface ICampaignStats extends ICampaign, IPublicStats {
  users: IUserStats[];
}
/* End Section Campaigns */