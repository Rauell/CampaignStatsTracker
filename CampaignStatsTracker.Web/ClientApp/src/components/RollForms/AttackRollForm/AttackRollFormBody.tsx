import React from 'react';
import { Col, Row } from 'reactstrap';
import {
  ModifierInput,
  ModifierInputProps,
  SkillTypeInput,
  SkillTypeInputProps,
  AttackRollSuccessInput,
  AttackRollSuccessInputProps,
  RollValueInput,
  RollValueInputProps,
} from '../Inputs';

export type AttackRollFormBodyProps =
  ModifierInputProps
  & SkillTypeInputProps
  & AttackRollSuccessInputProps
  & RollValueInputProps;
const AttackRollFormBody = (props: AttackRollFormBodyProps) => (
  <Row>
    <Col md={5}>
      <Row>
        <Col xs={12}>
          <SkillTypeInput {...props} />
        </Col>
        <Col xs={12}>
          <AttackRollSuccessInput {...props} />
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

export default AttackRollFormBody;
