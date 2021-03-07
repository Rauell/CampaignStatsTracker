import React from 'react';
import { FormGroup, Label } from 'reactstrap';
import InputPropsBase from './InputPropsBase';
import { SelectInput } from '../../FormInputs';
import { Attribute, AttributeListing } from '../../../settings/attributes';

type Props = InputPropsBase & {
  attributeType: Attribute;
  onAttributeTypeInputChange: (attributeType: Attribute) => void;
};

const AttributeTypeInput = (props: Props) => {
  const {
    attributeType,
    onAttributeTypeInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label>Attribute Type</Label>
      <SelectInput
        value={attributeType}
        onChange={onAttributeTypeInputChange}
        {...remainingProps}
      >
        {AttributeListing.map((a) => <option key={a}>{a}</option>)}
      </SelectInput>
    </FormGroup>
  );
};

export default AttributeTypeInput;
