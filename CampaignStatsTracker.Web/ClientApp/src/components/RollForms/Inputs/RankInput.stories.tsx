import React from 'react';
import { Story, Meta } from '@storybook/react';
import RankInput, { RankInputProps } from './RankInput';

const metaData: Meta = {
  title: 'RollForms/Inputs/RankInput',
  component: RankInput,
};
export default metaData;

const Template: Story<RankInputProps> = (args) => <RankInput {...args} />;

export const Default = Template.bind({});
