import React, { useState } from 'react';
import { Row, Col, FormGroup, Label, Input } from "reactstrap";
import { Guid } from "guid-typescript";
import { IUser } from '../../types';

interface IProps {
  characters: IUser[];
  disabled?: boolean;
  onChange?: (id: Guid) => void
}

const CharacterSelect = (props: IProps) => {
  const { characters, onChange, disabled } = props;
  const [characterId, setCharacterId] = useState<Guid>(Guid.createEmpty());

  const inputProps = {
    onChange: (e: React.ChangeEvent<HTMLInputElement>) => {
      const id = Guid.parse(e.target.value);
      setCharacterId(id);
      onChange && onChange(id);
    },
    disabled,
  };

  return (
    <FormGroup>
      <Label for="characterId">Character Select</Label>
      <Input
        type="select"
        name="character"
        id="characterId"
        value={characterId.toString()}
        {...inputProps}
      >
        <option value={Guid.EMPTY}></option>
        {characters.map(c => <option key={c.publicId.toString()} value={c.publicId.toString()}>{c.name}</option>)}
      </Input>
    </FormGroup>
  );
};

export default CharacterSelect;
