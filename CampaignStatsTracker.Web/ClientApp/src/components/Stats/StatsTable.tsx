import React from 'react';
import { Table, Badge } from 'reactstrap';
import { INamedPublicEntityStats } from '../../types';

interface IProps {
  stats: INamedPublicEntityStats | INamedPublicEntityStats[];
};

const toPercentString = (value: number) => `${(value * 100).toFixed(1)}%`
const toRawValueString = (value: number) => value.toFixed(1);

const StatsTable = (props: IProps) => {
  const { stats } = props;
  const loopStats = Array.isArray(stats) ? stats : [stats];

  if (!loopStats.length) return null;

  return (
    <Table striped hover bordered responsive>
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
            <td>
              <Badge>
                {toRawValueString(s.stats.skill.average)}
              </Badge>
            </td>
            <td>
              <Badge>
                {toPercentString(s.stats.skill.successRate)}
              </Badge>
            </td>
            <td>
              <Badge color="success">
                {toPercentString(s.stats.skill.criticalSuccessRate)}
              </Badge>
              {'  |  '}
              <Badge color="danger">
                {toPercentString(s.stats.skill.criticalFailureRate)}
              </Badge>
            </td>
            <td>
              <Badge>
                {toRawValueString(s.stats.damage.average)}
              </Badge>
            </td>
            <td>
              <Badge>
                {toPercentString(s.stats.damage.successRate)}
              </Badge>
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
};

export default StatsTable;