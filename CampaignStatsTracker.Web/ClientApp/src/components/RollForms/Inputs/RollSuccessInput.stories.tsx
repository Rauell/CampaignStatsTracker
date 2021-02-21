import React from 'react';
import { Story, Meta } from '@storybook/react';
import RollSuccessInput, { RollSuccessInputProps, RollSuccessOptions } from './RollSuccessInput';

export default {
  title: 'RollForms/Inputs/RollSuccessInput',
  component: RollSuccessInput,
  args: {
    rollSuccess: RollSuccessOptions.None,
  },
} as Meta;

const Template: Story<RollSuccessInputProps> = (args) => <RollSuccessInput {...args} />;

export const Default = Template.bind({});

export const Success = Template.bind({});
Success.args = {
  rollSuccess: RollSuccessOptions.Success,
};

export const Failure = Template.bind({});
Failure.args = {
  rollSuccess: RollSuccessOptions.Failure,
};
