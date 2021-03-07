import React, { ComponentProps } from 'react';
import { Story, Meta } from '@storybook/react';
import AttributeTypeInput from './AttributeTypeInput';
import { Attribute } from "../../../settings/attributes";

const metaData: Meta = {
  title: 'RollForms/Inputs/AttributeTypeInput',
  component: AttributeTypeInput,
  args: {
    attributeType: "Strength" as Attribute,
  },
};

export default metaData;

const Template: Story<ComponentProps<typeof AttributeTypeInput>> = (args) => <AttributeTypeInput {...args} />;

export const Default = Template.bind({});
