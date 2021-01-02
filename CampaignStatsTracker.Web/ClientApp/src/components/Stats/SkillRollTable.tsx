import React, { useState } from 'react';
import { Table } from 'reactstrap';
import { IRoll } from './types';

interface IProps {
  rolls: IRoll[];
}

interface IColumn {
  name: string;
  getCell: (roll: IRoll) => React.ReactElement;
}

const defaultMaxDieRoll = 20;

const getType = (roll: IRoll) => <td>{roll.type}</td>;
const getBaseValue = (roll: IRoll) => {
  const extraClasses = [];

  if (roll.value === 1) extraClasses.push("table-danger");
  else if (roll.value === (roll.maxDieRoll || defaultMaxDieRoll)) extraClasses.push("table-success");

  return <td className={extraClasses.join(' ')}>{roll.value}</td>
};
const getModifiers = (roll: IRoll) => <td></td>;
const getFinalValue = (roll: IRoll) => (
  <td>
    {roll.value + (roll.attributeModifier || 0) + (roll.extraModifier || 0)}
  </td>
);
const getStatus = (roll: IRoll) => <td>{roll.statusText}</td>;

const getDamageValue = (roll: IRoll) => <td>{roll.damage?.value}</td>;
const getDamageType = (roll: IRoll) => <td>{roll.damage?.type}</td>;
const getDamageSource = (roll: IRoll) => <td>{roll.damage?.source}</td>;
const getDamageTarget = (roll: IRoll) => <td>{roll.damage?.target}</td>;
const getDamageComments = (roll: IRoll) => <td>{roll.damage?.comment}</td>;

const statColumns: IColumn[] = [
  { name: 'Type', getCell: getType },
  { name: 'Base Value', getCell: getBaseValue },
  { name: 'Modifiers', getCell: getModifiers },
  { name: 'Final Value', getCell: getFinalValue },
  { name: 'Result', getCell: getStatus },
];

const damageColumns: IColumn[] = [
  { name: 'Total', getCell: getDamageValue },
  { name: 'Type', getCell: getDamageType },
  { name: 'Source', getCell: getDamageSource },
  { name: 'Target', getCell: getDamageTarget },
  { name: 'Comments', getCell: getDamageComments },
]

const SkillRollTable = (props: IProps) => {
  const { rolls } = props;
  const [showDamage, setShowDamage] = useState(true);

  const columnGroups = [{ name: 'Skill Rolls', columns: statColumns }];
  if (showDamage) columnGroups.push({ name: 'Damage Rolls', columns: damageColumns });

  return (
    <Table striped hover responsive bordered>
      <thead>
        <tr>
          {columnGroups.map(cg => (
            <th colSpan={cg.columns.length}>
              <div className="d-flex justify-content-center">
                {cg.name}
              </div>
            </th>
          ))}
        </tr>
        <tr>
          {columnGroups.map(cg =>
            cg.columns.map((c, i) =>
              <th key={`${cg.name}-${i}`} scope="col">{c.name}</th>
            )
          )}
        </tr>
      </thead>
      <tbody>
        {rolls.map(r => (
          <tr key={r.id}>
            {columnGroups.map(cg =>
              cg.columns.map(
                c => c.getCell(r)
              )
            )}
          </tr>
        ))}
      </tbody>
    </Table>
  );
}

export default SkillRollTable;