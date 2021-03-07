import React from 'react';
import { FormGroup, Label, Input } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

const defaultSkills = [
  'Acrobatics',
  'Animal Handling',
  'Arcana',
  'Athletics',
  'Deception',
  'History',
  'Insight',
  'Intimidation',
  'Investigation',
  'Medicine',
  'Nature',
  'Perception',
  'Performance',
  'Persuasion',
  'Religion',
  'Sleight of Hand',
  'Stealth',
  'Survival',
];

type Props = InputPropsBase & {
  skillType: string;
  onSkillTypeInputChange: (rollType: string) => void;
};

const SkillTypeInput = (props: Props) => {
  const {
    skillType,
    onSkillTypeInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label>Skill Type</Label>
      <Input
        type="select"
        value={defaultSkills.some((s) => s === skillType) ? skillType : ''}
        onChange={(e) => onSkillTypeInputChange(e.target.value)}
        {...remainingProps}
      >
        <option value="">N/A</option>
        {defaultSkills.map((s) => <option key={s}>{s}</option>)}
      </Input>
    </FormGroup>
  );
};

export default SkillTypeInput;
