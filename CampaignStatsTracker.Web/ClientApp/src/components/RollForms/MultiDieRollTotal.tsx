import React from 'react';
import { Badge } from 'reactstrap';

type RollValues = {
  values: number[]
};

type Props = {
  modifier: number;
  multiDieRollValues: RollValues[]
};

const MultiDieRollTotal = (props: Props) => {
  const { modifier, multiDieRollValues } = props;
  const allValues = multiDieRollValues.map((l) => l.values).flat();
  const total = modifier + allValues.reduce((l, r) => l + r, 0);

  return (
    <>
      {'Total: '}
      <Badge>
        {total}
      </Badge>
    </>
  );
};

export default MultiDieRollTotal;
