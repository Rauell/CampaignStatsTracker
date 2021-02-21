import React from 'react';
import { Story, Meta } from '@storybook/react';

import SkillTypeInput, { SkillTypeInputProps } from './SkillTypeInput';

export default {
  title: 'RollForms/Inputs/SkillTypeInput',
  component: SkillTypeInput,
} as Meta;

const Template: Story<SkillTypeInputProps> = (args) => <SkillTypeInput {...args} />;

export const NoSkillSelected = Template.bind({});
NoSkillSelected.args = {};

export const SkillSelected = Template.bind({});
SkillSelected.args = {
  skillType: 'Religion',
};

export const InvalidSkillSelected = Template.bind({});
InvalidSkillSelected.args = {
  skillType: "Invalid Skill That doesn't exist",
};
