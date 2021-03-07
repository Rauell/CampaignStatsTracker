import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';
import MultiDieValueInput from './MultiDieValueInput';
import { DieType } from '../../../options';

export default {
  title: 'RollForms/Inputs/MultiDieValueInput',
  component: MultiDieValueInput,
  args: {
    multiDieRollValues: [],
  },
} as Meta;

const Template: Story<ComponentProps<typeof MultiDieValueInput>> = (args) => (
  <MultiDieValueInput {...args} />
);

export const Default = Template.bind({});

const d6Line = {
  dieType: DieType.D6,
  values: [1, 4, 6],
  valueText: '11',
  errorText: '',
  isValid: true,
};

const d10Line = {
  dieType: DieType.D10,
  values: [1, 4, 11],
  valueText: '1 4 11',
  isValid: false,
  errorText: 'error text',
};

export const OneTypeSelected = Template.bind({});
OneTypeSelected.args = {
  multiDieRollValues: [d6Line],
};

export const TwoTypesSelected = Template.bind({});
TwoTypesSelected.args = {
  multiDieRollValues: [
    d6Line,
    d10Line,
  ],
};

export const Disabled = Template.bind({});
Disabled.args = {
  disabled: true,
  multiDieRollValues: [
    d6Line,
    d10Line,
  ],
};
