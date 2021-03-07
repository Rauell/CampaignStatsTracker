import React, { ComponentProps } from 'react';
import { Input } from 'reactstrap';

type Props<T> = {
  value: T;
  onChange: (newValue: T) => void;
} & Omit<ComponentProps<typeof Input>, 'value' | 'onChange' | 'type'>;

const SelectInput = <T extends string>(props: Props<T>) => {
  const { onChange, ...rest } = props;

  return (
    <Input
      type="select"
      onChange={(e) => onChange(e.target.value as T)}
      {...rest}
    />
  );
};

export default SelectInput;
