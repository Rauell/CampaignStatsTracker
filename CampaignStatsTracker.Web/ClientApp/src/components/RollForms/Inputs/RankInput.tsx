import React from 'react';
import { Input, FormGroup, Label } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

type Props = InputPropsBase & {
  rank: number | string;
  onRankInputChange: (value: number | string) => void;
};

const RankInput = (props: Props) => {
  const { rank, onRankInputChange, ...remainingProps } = props;

  return (
    <FormGroup>
      <Label>Rank</Label>
      <Input
        type="number"
        min="1"
        max="99"
        value={rank}
        onChange={(e) => onRankInputChange(e.target.value)}
        {...remainingProps}
      />
    </FormGroup>
  );
};

export default RankInput;
