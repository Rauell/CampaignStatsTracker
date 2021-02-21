import React from 'react';
import RollSuccessInputBase, { RollSuccessInputBaseProps } from './RollSuccessInputBase';

export { RollSuccessOptions } from './RollSuccessInputBase';

export type RollSuccessInputProps = Omit<RollSuccessInputBaseProps, 'rollSuccessText' | 'rollFailureText'>;

const RollSuccessInput = (props: RollSuccessInputProps) => (
  <RollSuccessInputBase
    rollSuccessText="Success"
    rollFailureText="Failure"
    {...props}
  />
);

export default RollSuccessInput;
