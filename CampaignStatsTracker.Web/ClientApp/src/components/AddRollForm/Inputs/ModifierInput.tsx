import React, { useState } from "react";
import { Input, InputProps } from "reactstrap";
import { tryParseInt } from '../../../utilities';

interface IProps {
  modifier: number;
  onChange: (value: number) => void;
  disabled?: boolean;
};

const ModifierInput = (props: IProps) => {
  const { onChange, modifier, ...remainingProps } = props;

  return <Input
    type="number"
    min="-99"
    max="99"
    value={modifier}
    onChange={e => onChange(parseInt(e.target.value))}
    {...remainingProps}
  />;
};

export default ModifierInput;
