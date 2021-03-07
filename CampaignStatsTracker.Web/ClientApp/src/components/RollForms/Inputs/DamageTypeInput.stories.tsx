import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';

import DamageTypeInput from './DamageTypeInput';

export default {
  title: 'RollForms/Inputs/DamageTypeInput',
  component: DamageTypeInput,
} as Meta;

const Template: Story<ComponentProps<typeof DamageTypeInput>> = (args) => (
  <DamageTypeInput {...args} />
);

export const NoTypeSelected = Template.bind({});
NoTypeSelected.args = {};

export const TypeSelected = Template.bind({});
TypeSelected.args = {
  damageType: 'Slashing',
};

export const InvalidTypeSelected = Template.bind({});
InvalidTypeSelected.args = {
  damageType: "Invalid Damage That doesn't exist",
};
