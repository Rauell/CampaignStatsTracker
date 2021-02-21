import React from 'react';
import {
  Table, Badge, Card, CardHeader, CardBody,
} from 'reactstrap';
import { generatePath } from 'react-router';
import { useHistory } from 'react-router-dom';
import { IRoll } from '../../types';
import Routes from '../../Routes';

export type RollTableProps = {
  rolls: IRoll[];
};

const RollTable = (props: RollTableProps) => {
  const { rolls } = props;
  const history = useHistory();

  const goToEditRoll = (publicId: string) => {
    history.push(generatePath(Routes.rollEdit, { rollId: publicId }));
  };

  return (
    <Card>
      <CardHeader>Recent Rolls</CardHeader>
      <CardBody>
        <Table borderless hover responsive>
          <thead>
            <tr>
              <th scope="col">Created</th>
              <th scope="col">Type</th>
              <th scope="col">Value</th>
            </tr>
          </thead>
          <tbody>
            {rolls.map((r) => (
              <tr key={r.publicId} onClick={() => goToEditRoll(r.publicId)} style={{ cursor: 'pointer' }}>
                <td>{r.dateCreated}</td>
                <td>{r.rollType}</td>
                <td>
                  <Badge>
                    {r.value + r.modifier}
                  </Badge>
                  {r.modifier !== 0
                    && (
                    <small>
                      {' '}
                      <Badge>
                        {`(${r.value} + ${r.modifier})`}
                      </Badge>
                    </small>
                    )}
                </td>
              </tr>
            ))}
          </tbody>
        </Table>
      </CardBody>
    </Card>
  );
};

export default RollTable;
