import React from 'react';
import { Table } from 'reactstrap';
import { IPublicStats } from '../../types';

interface IProps {
  stats: IPublicStats | IPublicStats[];
};

const toPercentString = (value: number) => `${(value * 100).toFixed(1)}%`

const StatsTable = (props: IProps) => {
  const { stats } = props;
  const loopStats = Array.isArray(stats) ? stats : [stats];

  if (!loopStats.length) return null;

  return (
    <Table striped hover bordered>
      <thead>
        <tr>
          <th scope="col">Name</th>
          <th scope="col">Average Roll</th>
          {/* <th scope="col">Most Rolled Skill</th> */}
          <th scope="col">Success Rate</th>
          <th scope="col">Crit Rate</th>
          <th scope="col">Average Damage</th>
          {/* <th scope="col">Most Common Attack</th> */}
          <th scope="col">Hit Rate</th>
        </tr>
      </thead>
      <tbody>
        {loopStats.map(s => (
          <tr key={s.publicId}>
            <th scope="row">{s.name}</th>
            <td>{s.stats.skill.average}</td>
            {/* <td>{s.stats.skill.typeMode}</td> */}
            <td>
              {toPercentString(s.stats.skill.successRate)}
            </td>
            <td>
              <span className="table-success">
                {toPercentString(s.stats.skill.criticalSuccessRate)}
              </span>
              {'/'}
              <span className="table-danger">
                {toPercentString(s.stats.skill.criticalFailureRate)}
              </span>
            </td>
            <td>{s.stats.damage.average}</td>
            {/* <td>{s.stats.damage.attackMode}</td> */}
            <td>
              {toPercentString(s.stats.damage.successRate)}
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
};

export default StatsTable;