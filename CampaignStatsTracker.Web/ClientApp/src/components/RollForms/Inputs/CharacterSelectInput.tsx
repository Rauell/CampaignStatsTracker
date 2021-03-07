import React from 'react';
import { FormGroup, Label } from 'reactstrap';
import { Guid } from 'guid-typescript';
import InputPropsBase from './InputPropsBase';
import { SelectInput } from '../../FormInputs';

type Character = {
  id: Guid;
  name: string;
};

type Props = InputPropsBase & {
  characterId: Guid;
  characters: Character[];
  onCharacterSelectInputChange: (id: Guid) => void;
};

const CharacterSelectInput = (props: Props) => {
  const {
    characterId,
    characters,
    onCharacterSelectInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label for="characterSelect">Select Character</Label>
      <SelectInput
        id="characterSelect"
        type="select"
        value={characterId.toString()}
        onChange={(newValue) => onCharacterSelectInputChange(Guid.parse(newValue))}
        {...remainingProps}
      >
        <option value={Guid.EMPTY}>--</option>
        {characters.map((c) => (
          <option key={c.id.toString()} value={c.id.toString()}>
            {c.name}
          </option>
        ))}
      </SelectInput>
    </FormGroup>
  );
};

export default CharacterSelectInput;
