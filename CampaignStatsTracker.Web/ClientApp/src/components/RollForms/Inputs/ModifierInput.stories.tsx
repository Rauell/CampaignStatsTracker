import React from 'react';
import { Story, Meta } from '@storybook/react';

import ModifierInput, { ModifierInputProps } from './ModifierInput';

export default {
  title: 'RollForms/Inputs/ModifierInput',
  component: ModifierInput,
} as Meta;

const Template: Story<ModifierInputProps> = (args) => <ModifierInput {...args} />;

export const Default = Template.bind({});
