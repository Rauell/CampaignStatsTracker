import React from 'react';
import { Row, Col, Table, Button, Input } from 'reactstrap';
import { dieOptions } from '../../options';
import ModifierInput from './Inputs/ModifierInput';

export interface IDamageRoll {
  numberOfSides: number,
  result: number,
}

interface IProps {
  damageRolls: IDamageRoll[];
  setDamageRolls: (damageRolls: IDamageRoll[]) => void;
  disabled: boolean;
  damageModifier: number;
  setDamageModifier: (modifier: number) => void;
}

const newDefaultDamageRoll = () => ({ numberOfSides: 6, result: 1 });

const AddDamageDice = (props: IProps) => {
  const { damageRolls, setDamageRolls, damageModifier, setDamageModifier, ...otherProps } = props;

  const addDamageRoll = () =>
    setDamageRolls(damageRolls.concat(newDefaultDamageRoll()));

  const removeDamageRollAt = (index: number) =>
    setDamageRolls(damageRolls.filter((_, i) => index !== i));

  const updateDamageDieAt = (index: number, die: number, result: number) => {
    const updatedDamageDice = [...damageRolls];
    updatedDamageDice[index].numberOfSides = die;

    if (result > die) updatedDamageDice[index].result = die;
    else if (result < 1) updatedDamageDice[index].result = 1;
    else updatedDamageDice[index].result = result;

    setDamageRolls(updatedDamageDice);
  }

  const totalDamage = damageRolls.reduce((sum, r) => sum + r.result, 0) + damageModifier;

  return (
    <Row>
      <Col md={6}>
        <Table>
          <thead>
            <tr>
              <th>
                <Button size="sm" type="button" onClick={addDamageRoll} {...otherProps}>
                  {'Add'}
                </Button>
              </th>
              <th>
                <span>
                  {'Die'}
                </span>
              </th>
              <th>Result</th>
            </tr>
          </thead>
          <tbody>
            {damageRolls.map((d, i) => (
              <tr key={i}>
                <td>
                  <Button size="sm" type="button" onClick={_ => removeDamageRollAt(i)} {...otherProps}>
                    {'Remove'}
                  </Button>
                </td>
                <td>
                  <Input
                    type="select"
                    value={d.numberOfSides}
                    onChange={e => updateDamageDieAt(i, parseInt(e.target.value), d.result)}
                    {...otherProps}
                  >
                    {dieOptions.map(option => <option value={option} key={option}>{option}</option>)}
                  </Input>
                </td>
                <td>
                  <Input
                    type="number"
                    min="1"
                    max={d.numberOfSides}
                    value={d.result}
                    onChange={e => updateDamageDieAt(i, d.numberOfSides, parseInt(e.target.value))}
                    {...otherProps}
                  />
                </td>
              </tr>
            ))}
          </tbody>
        </Table>
      </Col>
      <Col md={6}>
        <Table>
          <thead>
            <tr>
              <th>Damage Modifier</th>
              <th>Total Damage</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <ModifierInput
                  onChange={setDamageModifier}
                  modifier={damageModifier}
                  {...otherProps}
                />
              </td>
              <td>
                <Input disabled value={isNaN(totalDamage) ? '-' : totalDamage} />
              </td>
            </tr>
          </tbody>
        </Table>
      </Col>
    </Row>
  );
};

export default AddDamageDice;