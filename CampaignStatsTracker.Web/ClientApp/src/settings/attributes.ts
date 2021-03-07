// export enum AttributeType {
//   Strength = "Strength",
//   Dexterity = "Dexterity",
//   Constitution = "Constitution",
//   Intelligence = "Intelligence",
//   Wisdom = "Wisdom",
//   Charisma = "Charisma",
// };

export type Attribute =
  'Strength' |
  'Dexterity' |
  'Constitution' |
  'Intelligence' |
  'Wisdom' |
  'Charisma';

export const AttributeListing = [
  'Strength',
  'Dexterity',
  'Constitution',
  'Intelligence',
  'Wisdom',
  'Charisma',
];

// export const AttributeListing = [
//   AttributeType.Strength,
//   AttributeType.Dexterity,
//   AttributeType.Constitution,
//   AttributeType.Intelligence,
//   AttributeType.Wisdom,
//   AttributeType.Charisma,
// ];

// type AttributeDetail = {
//   abbreviation: string;
// };

// export const getAttributeDetails = (attribute: AttributeType) => {
//   switch (attribute) {
//     case AttributeType.Strength:
//       return { abbreviation: 'Str' } as AttributeDetail;
//     case AttributeType.Dexterity:
//       return { abbreviation: 'Dex' } as AttributeDetail;
//     default:
//       throw `Unknown attribute type: ${attribute}`;
//   }
// };
