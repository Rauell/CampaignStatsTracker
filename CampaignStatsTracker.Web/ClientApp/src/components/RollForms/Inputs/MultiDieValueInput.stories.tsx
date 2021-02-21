import React from 'react';
import { Story, Meta } from '@storybook/react';
import MultiDieValueInput, { MultiDieValueInputProps } from './MultiDieValueInput';
import { DieType } from '../../../options';

export default {
  title: 'RollForms/Inputs/MultiDieValueInput',
  component: MultiDieValueInput,
  args: {
    multiDieRollValues: [],
  },
} as Meta;

const Template: Story<MultiDieValueInputProps> = (args) => <MultiDieValueInput {...args} />;

export const Default = Template.bind({});

export const OneTypeSelected = Template.bind({});
OneTypeSelected.args = {
  multiDieRollValues: [
    {
      dieType: DieType.D6,
      values: '1, 4, 6',
    },
  ],
};

export const TwoTypesSelected = Template.bind({});
TwoTypesSelected.args = {
  multiDieRollValues: [
    ...OneTypeSelected.args.multiDieRollValues,
    {
      dieType: DieType.D10,
      values: '1, 4, 11',
    },
  ],
};

export const Disabled = Template.bind({});
Disabled.args = {
  disabled: true,
  lines: [
    ...TwoTypesSelected.args.multiDieRollValues,
  ],
};
