import React, { ComponentProps } from 'react';
import { Col, Row, Alert } from 'reactstrap';
import { Guid } from 'guid-typescript';
import { RankInput } from '../Inputs';

export type InitiatveRollFormBodyProps = ComponentProps<typeof RankInput> & {
  characterId: Guid;
};

const InitiatveRollFormBody = (props: InitiatveRollFormBodyProps) => {
  const { characterId } = props;
  return (
    <Row>
      <Col>
        <RankInput {...props} />
        {characterId.equals(Guid.createEmpty())
          && (
            <Alert color="danger">
              A character must be selected!
            </Alert>
          )}
      </Col>
    </Row>
  );
};

export default InitiatveRollFormBody;
