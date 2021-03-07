import React, { ComponentProps } from 'react';
import { Col, Row, Badge } from 'reactstrap';
import {
  DamageTypeInput,
  ModifierInput,
  MultiDieValueInput,
  RollValueInput,
} from '../Inputs';

type Props =
  ComponentProps<typeof DamageTypeInput> &
  ComponentProps<typeof ModifierInput> &
  ComponentProps<typeof MultiDieValueInput> &
  ComponentProps<typeof RollValueInput>;

const DamageRollFormBody = (props: Props) => {
  const { modifier, multiDieRollValues } = props;
  const allValues = multiDieRollValues.map((l) => l.values).flat();
  const totalDamage = modifier + allValues.reduce((l, r) => l + r, 0);

  return (
    <Row>
      <Col>
        <Row>
          <Col xs={12}>
            <DamageTypeInput {...props} />
          </Col>
        </Row>

        <Row className="align-items-center">
          <Col md={12}>
            <h4>
              {'Total Damage: '}
              <Badge>
                {totalDamage}
              </Badge>
            </h4>
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
};

export default DamageRollFormBody;
