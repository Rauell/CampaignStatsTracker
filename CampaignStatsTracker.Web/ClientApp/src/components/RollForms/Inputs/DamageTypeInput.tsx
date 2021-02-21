import React from 'react';
import { FormGroup, Label, Input } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

const damageTypes = [
  {
    groupName: 'Physical',
    types: [
      'Slashing',
      'Piercing',
      'Bludgeoning',
    ],
  },
  {
    groupName: 'Elemental',
    types: [
      'Fire',
      'Cold',
      'Lightning',
      'Thunder',
      'Radiant',
      'Necrotic',
    ],
  },
  {
    groupName: 'Other',
    types: [
      'Acid',
      'Poison',
      'Force',
      'Pyschic',
    ],
  },
];

const allDamageTypes = damageTypes.map((g) => g.types).flat();

const damageTypeOptions = damageTypes.map((g) => (
  <optgroup label={g.groupName} key={g.groupName}>
    {g.types.map((d) => <option key={d} value={d}>{d}</option>)}
  </optgroup>
));

export type DamageTypeInputProps = InputPropsBase & {
  damageType: string;
  onDamageTypeInputChange: (damageType: string) => void;
};

const DamageTypeInput = (props: DamageTypeInputProps) => {
  const {
    damageType,
    onDamageTypeInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label>Damage Type</Label>
      <Input
        type="select"
        value={allDamageTypes.some((d) => d === damageType) ? damageType : ''}
        onChange={(e) => onDamageTypeInputChange(e.target.value)}
        {...remainingProps}
      >
        <option value="">--</option>
        {damageTypeOptions}
      </Input>
    </FormGroup>
  );
};

export default DamageTypeInput;
