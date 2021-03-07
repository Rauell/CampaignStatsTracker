import React, { ComponentProps } from 'react';
import RollSuccessInputBase from './RollSuccessInputBase';

export { RollSuccessOptions } from './RollSuccessInputBase';

type Props = Omit<ComponentProps<typeof RollSuccessInputBase>, 'rollSuccessText' | 'rollFailureText'>;

const RollSuccessInput = (props: Props) => (
  <RollSuccessInputBase
    rollSuccessText="Success"
    rollFailureText="Failure"
    {...props}
  />
);

export default RollSuccessInput;
