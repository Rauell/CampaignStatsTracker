import React from 'react';
import {
  Button,
  ButtonGroup,
  Col,
  FormFeedback,
  FormGroup,
  Input,
  InputGroup,
  InputGroupAddon,
  InputGroupText,
  Label,
  Row,
} from 'reactstrap';
import InputPropsBase from './InputPropsBase';
import { DieType, allDieTypes } from '../../../options';

type DieLine = {
  dieType: DieType;
  valueText: string;
  values: number[];
  errorText: string;
  isValid: boolean;
};

export const defaultDieLine: DieLine = {
  dieType: DieType.D6,
  valueText: '',
  values: [],
  errorText: '',
  isValid: false,
};

type Props = InputPropsBase & {
  multiDieRollValues: DieLine[];
  onMultiDieRollValuesChange: (lines: DieLine[]) => void;
};

const MultiDieValueInput = (props: Props) => {
  const { multiDieRollValues, onMultiDieRollValuesChange, ...remainingProps } = props;

  const addLine = (dieType: DieType) => {
    if (multiDieRollValues.some((l) => l.dieType === dieType)) return;

    const newLines = [{ ...defaultDieLine, dieType }, ...multiDieRollValues]
      .sort((left, right) => left.dieType - right.dieType);

    onMultiDieRollValuesChange(newLines);
  };

  const removeLine = (dieType: DieType) => {
    const newLines = multiDieRollValues.filter((l) => l.dieType !== dieType);
    if (newLines.length === multiDieRollValues.length) return;

    onMultiDieRollValuesChange(newLines);
  };

  const editLineValue = (dieType: DieType, value: string) => {
    const newLines = [...multiDieRollValues];
    const line = newLines.filter((l) => l.dieType === dieType)[0];

    line.valueText = value;
    line.isValid = false;
    line.errorText = '';
    line.values = value
      .split(/[\s,]+/)
      .filter((s) => s)
      .map((v) => Math.floor(Number(v)));

    if (line.values.length) {
      if (line.values.some((v) => Number.isNaN(v))) {
        line.errorText = 'Not all values are numbers';
      } else if (line.values.some((v) => v > line.dieType)) {
        line.errorText = `Some values are greater than ${line.dieType}`;
      } else if (line.values.some((v) => v < 1)) {
        line.errorText = 'Some values are less than 1';
      } else {
        line.isValid = true;
      }
    }

    onMultiDieRollValuesChange(newLines);
  };

  const dieControlButtons = allDieTypes.map((d) => {
    const active = multiDieRollValues.some((l) => l.dieType === d);
    const toggle = () => (active ? removeLine(d) : addLine(d));

    return (
      <Button
        active={active}
        color={active ? 'primary' : 'secondary'}
        onClick={toggle}
        {...remainingProps}
      >
        {d}
      </Button>
    );
  });

  return (
    <FormGroup>
      <Row>
        <Col>
          <Label>Add multiple dice</Label>
        </Col>
      </Row>

      <Row>
        <Col>
          <ButtonGroup>
            {dieControlButtons}
          </ButtonGroup>
        </Col>
      </Row>

      <Row>
        {multiDieRollValues.map((l) => (
          <Col xs={12}>
            <InputGroup key={l.dieType}>
              <InputGroupAddon addonType="prepend">
                <InputGroupText>
                  {`D${l.dieType}`}
                </InputGroupText>
              </InputGroupAddon>

              <Input
                value={l.valueText}
                valid={l.isValid}
                invalid={!!l.errorText}
                onChange={(e) => editLineValue(l.dieType, e.target.value)}
                {...remainingProps}
              />

              <FormFeedback tooltip>
                {l.errorText}
              </FormFeedback>

              <InputGroupAddon addonType="append">
                <InputGroupText>
                  {l.isValid
                    ? (
                      <>
                        {l.values.reduce((left, right) => left + right)}
                        {' '}
                        <small>{`(${l.values.length})`}</small>
                        {' '}
                      </>
                    )
                    : '--'}
                </InputGroupText>
              </InputGroupAddon>
            </InputGroup>
          </Col>
        ))}
      </Row>
    </FormGroup>
  );
};

export default MultiDieValueInput;
