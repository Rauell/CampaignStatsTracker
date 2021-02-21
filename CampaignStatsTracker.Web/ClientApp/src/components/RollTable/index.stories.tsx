import React from 'react';
import { Story, Meta } from '@storybook/react';

import RollTable, { RollTableProps } from './index';

export default {
  title: 'Tables/RollHistory',
  component: RollTable,
  args: {
    rolls: [],
  },
} as Meta;

const Template: Story<RollTableProps> = (args) => <RollTable {...args} />;

export const Default = Template.bind({});
