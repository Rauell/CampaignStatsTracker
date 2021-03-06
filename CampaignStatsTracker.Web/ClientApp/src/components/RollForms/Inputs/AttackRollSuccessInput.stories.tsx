import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';

import AttackRollSuccessInput, { RollSuccessOptions } from './AttackRollSuccessInput';

export default {
  title: 'RollForms/Inputs/AttackRollSuccessInput',
  component: AttackRollSuccessInput,
  args: {
    rollSuccess: RollSuccessOptions.None,
  },
} as Meta;

const Template: Story<ComponentProps<typeof AttackRollSuccessInput>> = (args) => (
  <AttackRollSuccessInput {...args} />
);

export const Default = Template.bind({});

export const Success = Template.bind({});
Success.args = {
  rollSuccess: RollSuccessOptions.Success,
};

export const Failure = Template.bind({});
Failure.args = {
  rollSuccess: RollSuccessOptions.Failure,
};
