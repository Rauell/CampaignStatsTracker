import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';
import RankInput from './RankInput';

const metaData: Meta = {
  title: 'RollForms/Inputs/RankInput',
  component: RankInput,
};
export default metaData;

const Template: Story<ComponentProps<typeof RankInput>> = (args) => <RankInput {...args} />;

export const Default = Template.bind({});
