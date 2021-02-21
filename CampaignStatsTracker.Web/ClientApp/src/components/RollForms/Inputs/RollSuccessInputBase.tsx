import React from 'react';
import { ButtonGroup, Button } from 'reactstrap';
import InputPropsBase from './InputPropsBase';

export enum RollSuccessOptions {
  Success = 'Success',
  None = 'N/A',
  Failure = 'Failure',
}

export const rollSuccessOptionAsBool = (option: RollSuccessOptions) => {
  switch (option) {
    case RollSuccessOptions.Success:
      return true;
    case RollSuccessOptions.Failure:
      return false;
    case RollSuccessOptions.None:
    default:
      return null;
  }
};

export type RollSuccessInputBaseProps = InputPropsBase & {
  rollSuccess: RollSuccessOptions;
  rollSuccessText: string;
  rollFailureText: string;
  onRollSuccessInputChange: (success: RollSuccessOptions) => void;
};

const RollSuccessInputBase = (props: RollSuccessInputBaseProps) => {
  const {
    rollSuccess,
    rollSuccessText,
    rollFailureText,
    onRollSuccessInputChange,
    ...remainingProps
  } = props;

  const buttons = [
    {
      value: RollSuccessOptions.Success,
      text: rollSuccessText,
      color: 'success',
    },
    {
      value: RollSuccessOptions.None,
      text: 'N/A',
    },
    {
      value: RollSuccessOptions.Failure,
      text: rollFailureText,
      color: 'danger',
    },
  ].map((b) => (
    <Button
      active={b.value === rollSuccess}
      outline={b.value !== rollSuccess}
      color={b.color}
      onClick={() => onRollSuccessInputChange(b.value)}
      {...remainingProps}
    >
      {b.text}
    </Button>
  ));

  return (
    <ButtonGroup className="d-flex">
      {buttons}
    </ButtonGroup>
  );
};

export default RollSuccessInputBase;
