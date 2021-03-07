import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';
import { Guid } from 'guid-typescript';
import CharacterSelectInput from './CharacterSelectInput';

const metaData: Meta = {
  title: 'RollForms/Inputs/CharacterSelectInput',
  component: CharacterSelectInput,
  args: {
    characterId: Guid.EMPTY,
    characters: [
      {
        name: 'Tom Brady',
        id: Guid.create(),
      },
      {
        name: 'Alvin',
        id: Guid.create(),
      },
      {
        name: 'George Washington',
        id: Guid.create(),
      },
    ],
  },
};

const Template: Story<ComponentProps<typeof CharacterSelectInput>> = (args) => (
  <CharacterSelectInput {...args} />
);

export const NoCharacterSelected = Template.bind({});
NoCharacterSelected.args = {};

export const CharacterSelected = Template.bind({});
CharacterSelected.args = {
  characterId: metaData.args?.characters[0].id,
};

export const InvalidCharacterSelected = Template.bind({});
InvalidCharacterSelected.args = {
  characterId: Guid.create(),
};

export default metaData;
