import React from 'react';
import { Input, FormGroup, Label } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

type Props = InputPropsBase & {
  rollValue: number | string;
  onRollValueInputChange: (value: number | string) => void;
};

const RollValueInput = (props: Props) => {
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
