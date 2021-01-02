import React from 'react';
import SkillRollTable from '../Stats/SkillRollTable';

// interface IDamage {
//   value: number;
//   type?: string;
//   isCritical?: boolean;
//   source?: string;
//   target?: string;
//   comment?: string;
// }

// interface IRoll {
//   type: string;
//   value: number;
//   attribute?: string;
//   attributeModifier?: number;
//   extraModifier?: number;
//   result: string;
//   damage?: IDamage;
//   maxDieRoll: number;
// }

// interface IProps {
//   rolls: IRoll[];
// }

const RollStatsPage = () => {
  const props = {
    rolls: Array(100).fill(
      {
        id: '1',
        type: 'foo',
        value: 4,
        status: 'status',
      }
    ),
  };
  return (
    <>
      <div>Hello World</div>
      <SkillRollTable {...props} />
    </>
  );
}

export default RollStatsPage;