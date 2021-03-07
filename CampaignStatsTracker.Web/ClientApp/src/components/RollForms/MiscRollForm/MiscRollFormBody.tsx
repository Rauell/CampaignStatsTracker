import React, { ComponentProps } from 'react';
import { Col, Row } from 'reactstrap';
import MultiDieRollTotal from '../MultiDieRollTotal';
import {
  ModifierInput,
  MultiDieValueInput,
  RollValueInput,
  RollSuccessInput,
} from '../Inputs';

type Props =
  ComponentProps<typeof ModifierInput> &
  ComponentProps<typeof MultiDieValueInput> &
  ComponentProps<typeof RollValueInput> &
  ComponentProps<typeof RollSuccessInput>;

const MiscRollFormBody = (props: Props) => (
  <Row>
    <Col>

      <Row className="align-items-center">
        <Col md={7}>
          <h4>
            <MultiDieRollTotal {...props} />
          </h4>
        </Col>
        <Col md={5}>
          <RollSuccessInput {...props} />
        </Col>
      </Row>

      <Row>
        <Col md={5} className="order-md-2">
          <Row>
            <Col>
              <ModifierInput {...props} />
            </Col>
          </Row>
        </Col>
        <Col md={7} className="order-md-1">
          <MultiDieValueInput {...props} />
        </Col>
      </Row>
    </Col>
  </Row>
);

export default MiscRollFormBody;
