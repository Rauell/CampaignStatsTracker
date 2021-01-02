import React from 'react';
import { Table } from 'reactstrap';

interface ISkill {
  average: number;
  typeMode: string;
  successRate: number;
  critSuccessRate: number;
  critFailureRate: number;
}

interface IDamage {
  average: number;
  attackMode: string;
  successRate: number;
}

interface IUser {
  name: string;
  id: string;
}

interface IUserStats {
  skill: ISkill;
  damage: IDamage;
  user: IUser;
}

interface IProps {
  stats: IUserStats[];
};

const toPercentString = (value: number) => `${(value * 100).toFixed(1)}%`

const StatsTable = (props: IProps) => {
  const { stats } = props;
  return (
    <Table striped hover bordered>
      <thead>
        <tr>
          <th scope="col">Name</th>
          <th scope="col">Average Roll</th>
          <th scope="col">Most Rolled Skill</th>
          <th scope="col">Success Rate</th>
          <th scope="col">Crit Rate</th>
          <th scope="col">Average Damage</th>
          <th scope="col">Most Common Attack</th>
          <th scope="col">Hit Rate</th>
        </tr>
      </thead>
      <tbody>
        {stats.map(s => (
          <tr key={s.user.id}>
            <th scope="row">{s.user.name}</th>
            <td>{s.skill.average}</td>
            <td>{s.skill.typeMode}</td>
            <td>
              {toPercentString(s.skill.successRate)}
            </td>
            <td>
              <span className="table-success">
                {toPercentString(s.skill.critSuccessRate)}
              </span>
              {'/'}
              <span className="table-danger">
                {toPercentString(s.skill.critFailureRate)}
              </span>
            </td>
            <td>{s.damage.average}</td>
            <td>{s.damage.attackMode}</td>
            <td>
              {toPercentString(s.damage.successRate)}
            </td>
          </tr>
        ))}
      </tbody>
    </Table>
  );
};

export default StatsTable;