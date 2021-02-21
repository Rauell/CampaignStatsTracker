import React from 'react';
import { FormGroup, Label, Input } from 'reactstrap';
import { Guid } from 'guid-typescript';
import InputPropsBase from './InputPropsBase';

type Character = {
  id: Guid;
  name: string;
};

export type CharacterSelectInputProps = InputPropsBase & {
  characterId: Guid;
  characters: Character[];
  onCharacterSelectInputChange: (id: Guid) => void;
};

const CharacterSelectInput = (props: CharacterSelectInputProps) => {
  const {
    characterId,
    characters,
    onCharacterSelectInputChange,
    ...remainingProps
  } = props;

  return (
    <FormGroup>
      <Label for="characterSelect">Select Character</Label>
      <Input
        id="characterSelect"
        type="select"
        value={characterId.toString()}
        onChange={(e) => onCharacterSelectInputChange(Guid.parse(e.target.value))}
        {...remainingProps}
      >
        <option value={Guid.EMPTY}>--</option>
        {characters.map((c) => (
          <option key={c.id.toString()} value={c.id.toString()}>
            {c.name}
          </option>
        ))}
      </Input>
    </FormGroup>
  );
};

export default CharacterSelectInput;
