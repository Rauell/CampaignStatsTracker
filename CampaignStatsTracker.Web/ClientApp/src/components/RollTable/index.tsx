import React from "react";
import { Table, Badge, Card, CardHeader, CardBody } from "reactstrap";
import { IRoll } from "../../types";

interface IProps {
  rolls: IRoll[];
};

const RollTable = (props: IProps) => {
  const { rolls } = props;

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
            {rolls.map(r => (
              <tr key={r.publicId}>
                <td>{r.dateCreated}</td>
                <td>{r.rollType}</td>
                <td>
                  <Badge>
                    {r.value + r.modifier}
                  </Badge>
                  {r.modifier !== 0 &&
                    <small>
                      {' '}
                      <Badge>
                        {`(${r.value} + ${r.modifier})`}
                      </Badge>
                    </small>
                  }
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
