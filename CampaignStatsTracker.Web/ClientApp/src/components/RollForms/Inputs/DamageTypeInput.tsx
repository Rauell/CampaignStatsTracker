import React from 'react';
import { FormGroup, Label } from 'reactstrap';
import InputPropsBase from './InputPropsBase';
import { SelectInput } from '../../FormInputs';

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

type Props = InputPropsBase & {
  damageType: string;
  onDamageTypeInputChange: (damageType: string) => void;
};

const DamageTypeInput = (props: Props) => {
  const {
    damageType,
    onDamageTypeInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label>Damage Type</Label>
      <SelectInput
        value={allDamageTypes.some((d) => d === damageType) ? damageType : ''}
        onChange={onDamageTypeInputChange}
        {...remainingProps}
      >
        <option value="">--</option>
        {damageTypeOptions}
      </SelectInput>
    </FormGroup>
  );
};

export default DamageTypeInput;
