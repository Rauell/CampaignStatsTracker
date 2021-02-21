import React from 'react';
import RollSuccessInputBase, { RollSuccessInputBaseProps } from './RollSuccessInputBase';

export { RollSuccessOptions } from './RollSuccessInputBase';

export type AttackRollSuccessInputProps = Omit<RollSuccessInputBaseProps, 'rollSuccessText' | 'rollFailureText'>;

const AttackRollSuccessInput = (props: AttackRollSuccessInputProps) => (
  <RollSuccessInputBase
    rollSuccessText="Hit"
    rollFailureText="Miss"
    {...props}
  />
);

export default AttackRollSuccessInput;
