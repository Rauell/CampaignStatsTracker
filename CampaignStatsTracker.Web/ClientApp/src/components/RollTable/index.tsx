import React from "react";
import { Table } from "reactstrap";
import { IRoll } from "../../types";

interface IProps {
  rolls: IRoll[];
};

const RollTable = (props: IProps) => {
  const { rolls } = props;

  return (
    <Table striped hover>
      <thead>
        <tr>
          <th scope="col">Created</th>
          <th scope="col">Type</th>
          <th scope="col">Value</th>
        </tr>
      </thead>
      <tbody>
        {rolls.map(r => (
          <tr>
            <td>{r.dateCreated}</td>
            <td>{r.rollType}</td>
            <td>
              {r.value + r.modifier}
              {' '}
              <small>
                {`(${r.value} + ${r.modifier})`}
              </small>
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
};

export default RollTable;
