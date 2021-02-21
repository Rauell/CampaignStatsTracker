import React from 'react';
import { Input, FormGroup, Label } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

export type RollValueInputProps = InputPropsBase & {
  rollValue: number | string;
  onRollValueInputChange: (value: number | string) => void;
};

const RollValueInput = (props: RollValueInputProps) => {
  const { rollValue, onRollValueInputChange, ...remainingProps } = props;

  return (
    <FormGroup>
      <Label>Value</Label>
      <Input
        type="number"
        min={1}
        max={20}
        value={rollValue}
        onChange={(e) => onRollValueInputChange(e.target.value)}
        {...remainingProps}
      />
    </FormGroup>
  );
};

export default RollValueInput;
