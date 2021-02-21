import React from 'react';
import { Input, FormGroup, Label } from 'reactstrap';

export type ModifierInputProps = {
  modifier: number;
  onModifierInputChange: (value: number) => void;
};

const ModifierInput = (props: ModifierInputProps) => {
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
