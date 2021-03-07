import React, { ComponentProps } from 'react';
import { Col, Row } from 'reactstrap';
import {
  ModifierInput,
  SkillTypeInput,
  AttackRollSuccessInput,
  RollValueInput,
} from '../Inputs';

type Props =
  ComponentProps<typeof ModifierInput> &
  ComponentProps<typeof SkillTypeInput> &
  ComponentProps<typeof AttackRollSuccessInput> &
  ComponentProps<typeof RollValueInput>;

const AttackRollFormBody = (props: Props) => (
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
