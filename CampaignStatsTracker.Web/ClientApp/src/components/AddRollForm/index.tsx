import React, { useState, useEffect } from 'react';
import { Col, Row, Form, FormGroup, Label, Input, Button, Card, CardHeader, CardBody, CardFooter, Table } from 'reactstrap';
import { useApiJsonResponse } from '../../hooks/useApi';
import LoadingSpinner from '../LoadingSpinner';
import { IPublicEntity } from '../../types';

interface IProps {
  formId?: string,
  entities?: IPublicEntity[],
}

interface IDamageRoll {
  numberOfSides: number,
  result: number,
}

const rollTypes = [
  'Skill',
  'Attack'
];

const dieOptions = [
  4, 6, 8, 10, 12, 20, 100
]

const getInputId = (id: string, formId: string) => `${formId}-${id}`;

const AddRollForm = (props: IProps) => {
  const { formId = '', entities = [] } = props;
  // const [formControls, setFormControls] = useState<IFormControls>(null);
  // const { isLoading } = useApiJsonResponse(setFormControls, '/api/rolls/controls');
  const isLoading = false;

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [rollType, setRollType] = useState(rollTypes[0]);
  const [rollValue, setRollValue] = useState(1);
  const [skillType, setSkillType] = useState('');
  const [rollModifier, setRollModifier] = useState(0);
  const [rollComment, setRollComment] = useState('');
  const [rollSucceeded, setRollSucceeded] = useState(false);

  const [damageRolls, setDamageRolls] = useState<IDamageRoll[]>([{ numberOfSides: 6, result: 1 }]);


  const rollTypeId = getInputId(formId, 'rollType');
  const skillTypeId = getInputId(formId, 'skillType');
  const rollValueId = getInputId(formId, 'rollValue');
  const rollNumberOfSidesId = getInputId(formId, 'numberOfSides');
  const rollCommentId = getInputId(formId, 'rollComment');
  const rollModifiersId = getInputId(formId, 'rollModifiers');
  const rollSucceededId = getInputId(formId, 'rollSucceeded');

  const onSubmit = async (event: React.FormEvent) => {
    event.preventDefault();

    setIsSubmitting(true);
    const response = await fetch(
      '/api/roll',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          rollType,
          skillType,
          rollValue,
          rollComment,
          rollModifier,
          rollSucceeded,
          damageRolls,
          entities: entities.map(e => ({ publicId: e.publicId })),
        }),
      }
    );
    setIsSubmitting(false);
    reset();
  };

  const reset = () => {
    setRollType(rollTypes[0]);
    setRollValue(1);
    setRollComment('');
    setRollSucceeded(false);
    setDamageRolls([{ numberOfSides: 6, result: 1 }]);
    setRollModifier(0);
  }

  const onAddDamageRollClick = () =>
    setDamageRolls(damageRolls.concat({ numberOfSides: 6, result: 1 }));
  ;

  const removeDamageRollAt = (index: number) =>
    setDamageRolls(damageRolls.filter((_, i) => index !== i))
    ;

  const updateDamageDieAt = (index: number, die: number, result: number) => {
    const updatedDamageDice = [...damageRolls];
    updatedDamageDice[index].numberOfSides = die;

    if (result > die) updatedDamageDice[index].result = die;
    else if (result < 1) updatedDamageDice[index].result = 1;
    else updatedDamageDice[index].result = result;

    setDamageRolls(updatedDamageDice);
  }

  return (
    <Card>

      <CardHeader>Add a Roll</CardHeader>
      <LoadingSpinner isLoading={isSubmitting}>
        <Form id={formId} onSubmit={onSubmit}>
          <CardBody>
            {/* <Input hidden type="number" name="numberOfSides" id={rollNumberOfSidesId} /> */}
            <Row className="align-item-center">
              <Col xs={4} sm={2}>
                <FormGroup>
                  <Label for={rollTypeId}>{'Roll Type'}</Label>
                  <Input
                    type="select"
                    name="type"
                    id={rollTypeId}
                    value={rollType}
                    onChange={e => setRollType(e.target.value)}
                  >
                    {rollTypes.map(r => <option key={r}>{r}</option>)}
                  </Input>
                </FormGroup>
              </Col>
              <Col xs={4} sm={2}>
                <FormGroup>
                  <Label for={rollValueId}>Result</Label>
                  <Input
                    type="select"
                    name="value"
                    id={rollValueId}
                    value={rollValue}
                    onChange={e => setRollValue(parseInt(e.target.value))}
                  >
                    {Array.from({ length: 20 }, (_, i) => i + 1).map(i => <option key={i} value={i}>{i}</option>)}
                  </Input>
                </FormGroup>
              </Col>
              <Col xs={4} sm={2}>
                <FormGroup>
                  <Label for={skillTypeId}>Skill Type</Label>
                  <Input
                    type="text"
                    maxLength={30}
                    name="skillType"
                    id={skillTypeId}
                    value={skillType}
                    onChange={e => setSkillType(e.target.value)}
                  />
                </FormGroup>
              </Col>
              <Col xs={2}>
                <FormGroup>
                  <Label for={rollModifiersId}>Modifier</Label>
                  <Input
                    type="number"
                    min={-100}
                    max={100}
                    name="modifiers"
                    id={rollModifiersId}
                    value={rollModifier}
                    onChange={e => setRollModifier(parseInt(e.target.value))}
                  />
                </FormGroup>
              </Col>
            </Row>
            <Row>
              <Col>
                <FormGroup check>
                  <Label for={rollSucceededId} check>
                    <Input
                      type="checkbox"
                      id={rollSucceededId}
                      name="success"
                      checked={rollSucceeded}
                      onChange={_ => setRollSucceeded(!rollSucceeded)}
                    />
                    {' Success'}
                  </Label>
                </FormGroup>
              </Col>
            </Row>
            <Row>
              <Col xs={12} sm={6} md={4}>
                <FormGroup>
                  <Label for={rollCommentId}>Comments</Label>
                  <Input
                    type="textarea"
                    maxLength={200}
                    name="comments"
                    id={rollCommentId}
                    value={rollComment}
                    onChange={e => setRollComment(e.target.value)}
                  />
                </FormGroup>
              </Col>
            </Row>
            {rollType === 'Attack' && rollSucceeded &&
              <Row>
                <Col md={6}>
                  <Table>
                    <thead>
                      <tr>
                        <th>
                          <Button szie="sm" type="button" onClick={onAddDamageRollClick}>
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
                            <Button size="sm" type="button" onClick={_ => removeDamageRollAt(i)}>
                              {'Remove'}
                            </Button>
                          </td>
                          <td>
                            <Input
                              type="select"
                              name={getInputId(formId, `damageDieType-${i}`)}
                              value={d.numberOfSides}
                              onChange={e => updateDamageDieAt(i, parseInt(e.target.value), d.result)}
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
                            />
                          </td>

                        </tr>
                      ))}
                    </tbody>
                  </Table>
                </Col>
              </Row>
            }
          </CardBody>
          <CardFooter>
            <Button>Submit</Button>
          </CardFooter>
        </Form>
      </LoadingSpinner >
    </Card>
  );
};

export default AddRollForm;