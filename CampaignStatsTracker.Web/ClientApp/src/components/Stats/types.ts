export interface IDamage {
  value: number;
  type?: string;
  isCritical?: boolean;
  source?: string;
  target?: string;
  comment?: string;
}

export interface IRoll {
  type: string;
  value: number;
  attribute?: string;
  attributeModifier?: number;
  extraModifier?: number;
  statusText: string;
  damage?: IDamage;
  maxDieRoll?: number;
  id: string | number;
}