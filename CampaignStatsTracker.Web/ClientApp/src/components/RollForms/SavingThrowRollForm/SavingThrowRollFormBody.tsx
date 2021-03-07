import React, { ComponentProps } from 'react';
import { Col, Row } from 'reactstrap';
import {
  ModifierInput,
  AttributeTypeInput,
  RollSuccessInput,
  RollValueInput,
} from '../Inputs';

export type SavingThrowRollFormBodyProps =
  ComponentProps<typeof ModifierInput> &
  ComponentProps<typeof RollValueInput> &
  ComponentProps<typeof RollSuccessInput> &
  ComponentProps<typeof AttributeTypeInput>;

const SavingThrowRollFormBody = (props: SavingThrowRollFormBodyProps) => (
  <Row>
    <Col md={5}>
      <Row>
        <Col xs={12}>
          <AttributeTypeInput {...props} />
        </Col>
        <Col xs={12}>
          <RollSuccessInput {...props} />
        </Col>
      </Row>
    </Col>
    <Col md={6}>
      <Row>
        <Col xs={12} lg={6}>
          <RollValueInput {...props} />
        </Col>
        <Col xs={12} lg={6}>
          <ModifierInput {...props} />
        </Col>
      </Row>
    </Col>
  </Row>
);

export default SavingThrowRollFormBody;
