import React, { ComponentProps } from 'react';
import RollSuccessInputBase from './RollSuccessInputBase';

export { RollSuccessOptions } from './RollSuccessInputBase';

type Props = Omit<ComponentProps<typeof RollSuccessInputBase>, 'rollSuccessText' | 'rollFailureText'>;

const AttackRollSuccessInput = (props: Props) => (
  <RollSuccessInputBase
    rollSuccessText="Hit"
    rollFailureText="Miss"
    {...props}
  />
);

export default AttackRollSuccessInput;
