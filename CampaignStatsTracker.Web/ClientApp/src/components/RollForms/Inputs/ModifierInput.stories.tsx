import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';

import ModifierInput from './ModifierInput';

export default {
  title: 'RollForms/Inputs/ModifierInput',
  component: ModifierInput,
} as Meta;

const Template: Story<ComponentProps<typeof ModifierInput>> = (args) => <ModifierInput {...args} />;

export const Default = Template.bind({});
