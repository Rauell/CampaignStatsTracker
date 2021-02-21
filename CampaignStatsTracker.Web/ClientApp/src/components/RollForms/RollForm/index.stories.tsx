import React from 'react';
import { Story, Meta } from '@storybook/react';
import RollForm, { RollFormProps } from '.';
import CharacterSelectInputMeta from '../Inputs/CharacterSelectInput.stories';

const metaData: Meta = {
  title: 'RollForms/RollForm',
  component: RollForm,
  args: {
    characters: CharacterSelectInputMeta.args.characters,
  },
};
export default metaData;

const Template: Story<RollFormProps> = (args) => <RollForm {...args} />;

export const Playground = Template.bind({});

export const NoCharacters = Template.bind({});
NoCharacters.args = {
  ...metaData.args,
  characters: [],
};
