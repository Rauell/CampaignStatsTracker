import React from 'react';
import { Input, FormGroup, Label } from 'reactstrap';

type Props = {
  modifier: number;
  onModifierInputChange: (value: number) => void;
};

const ModifierInput = (props: Props) => {
  const { onModifierInputChange, modifier, ...remainingProps } = props;

  return (
    <FormGroup>
      <Label>Modifier</Label>
      <Input
        type="number"
        min="-99"
        max="99"
        value={modifier}
        onChange={(e) => onModifierInputChange(parseInt(e.target.value, 10))}
        {...remainingProps}
      />
    </FormGroup>
  );
};

export default ModifierInput;
