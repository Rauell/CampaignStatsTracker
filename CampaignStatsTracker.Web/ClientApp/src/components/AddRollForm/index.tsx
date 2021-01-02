import React, { useState, useEffect } from 'react';
import { Guid } from "guid-typescript";
import { Col, Row, Form, FormGroup, Label, Input, Button, Card, CardHeader, CardBody, CardFooter, Table, Spinner } from 'reactstrap';
import { useApiJsonResponse } from '../../hooks/useApi';
// import LoadingSpinner from '../LoadingSpinner';
import { IPublicEntity, IPublicEntityStats, IUser } from '../../types';

interface IProps {
  formId?: string,
  entities?: IPublicEntity[],
  onSubmitSuccess?: (newStats: IPublicEntityStats[]) => void,
  characters?: IUser[],
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

const tryParseInt = (text: string, defaultValue: number) => {
  if (text && text.length) {
    const attempt = parseInt(text);
    if (!isNaN(attempt)) return attempt;
  }

  return defaultValue;
}

const formColumnSizes = { xs: 6, sm: 4, md: 3 };

const getInputId = (id: string, formId: string) => `${formId}-${id}`;

const AddRollForm = (props: IProps) => {
  const { formId = '', entities = [], onSubmitSuccess, characters } = props;
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
  const [selectedCharacterId, setSelectedCharacterId] = useState<string>(Guid.EMPTY);

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

    const entitiesToUse = entities.map(e => ({ publicId: e.publicId }));

    if (selectedCharacterId !== Guid.EMPTY) entitiesToUse.push({ publicId: selectedCharacterId });

    setIsSubmitting(true);
    try {
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
            entities: entitiesToUse,
          }),
        }
      );

      if (onSubmitSuccess) {
        const newStats: IPublicEntityStats[] = await response.json();
        onSubmitSuccess(newStats);
      }

      setRollComment('');
      setRollSucceeded(false);
      setDamageRolls([{ numberOfSides: 6, result: 1 }]);
    }
    catch (error) {
      alert("Error:" + error);
    }
    finally {
      setIsSubmitting(false);
    }
  };

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

      <CardHeader>
        {'Add a Roll'}
      </CardHeader>

      <Form id={formId} onSubmit={onSubmit}>
        <CardBody>
          {/* <Input hidden type="number" name="numberOfSides" id={rollNumberOfSidesId} /> */}
          {characters &&
            <Row>
              <Col>
                <FormGroup>
                  <Label for="characterId">Character Select</Label>
                  <Input
                    type="select"
                    name="character"
                    id="characterId"
                    value={selectedCharacterId.toString()}
                    onChange={e => setSelectedCharacterId(e.target.value)}
                    disabled={isSubmitting}
                  >
                    <option value={Guid.EMPTY}></option>
                    {characters.map(c => <option key={c.publicId} value={c.publicId}>{c.name}</option>)}
                  </Input>
                </FormGroup>
              </Col>
            </Row>
          }
          <Row className="align-item-center">
            <Col {...formColumnSizes}>
              <FormGroup>
                <Label for={rollTypeId}>{'Roll Type'}</Label>
                <Input
                  type="select"
                  name="type"
                  id={rollTypeId}
                  value={rollType}
                  onChange={e => setRollType(e.target.value)}
                  disabled={isSubmitting}
                >
                  {rollTypes.map(r => <option key={r}>{r}</option>)}
                </Input>
              </FormGroup>
            </Col>
            <Col {...formColumnSizes}>
              <FormGroup>
                <Label for={rollValueId}>Result</Label>
                <Input
                  type="number"
                  min={1}
                  max={20}
                  name="value"
                  id={rollValueId}
                  value={rollValue}
                  onChange={e => setRollValue(tryParseInt(e.target.value, 1))}
                  disabled={isSubmitting}
                />
                {/* <Input
                  type="select"
                  name="value"
                  id={rollValueId}
                  value={rollValue}
                  onChange={e => setRollValue(parseInt(e.target.value))}
                  disabled={isSubmitting}
                >
                  {Array.from({ length: 20 }, (_, i) => i + 1).map(i => <option key={i} value={i}>{i}</option>)}
                </Input> */}
              </FormGroup>
            </Col>
            <Col {...formColumnSizes}>
              <FormGroup>
                <Label for={skillTypeId}>Skill Type</Label>
                <Input
                  type="text"
                  maxLength={30}
                  name="skillType"
                  id={skillTypeId}
                  value={skillType}
                  onChange={e => setSkillType(e.target.value)}
                  disabled={isSubmitting}
                />
              </FormGroup>
            </Col>
            <Col {...formColumnSizes}>
              <FormGroup>
                <Label for={rollModifiersId}>Modifier</Label>
                <Input
                  type="number"
                  min={-100}
                  max={100}
                  name="modifiers"
                  id={rollModifiersId}
                  value={rollModifier}
                  onChange={e => setRollModifier(tryParseInt(e.target.value, 0))}
                  disabled={isSubmitting}
                />
              </FormGroup>
            </Col>
          </Row>
          <Row>
            <Col md={3}>
              <FormGroup check>
                <Label for={rollSucceededId} check>
                  <Input
                    type="checkbox"
                    id={rollSucceededId}
                    name="success"
                    checked={rollSucceeded}
                    onChange={_ => setRollSucceeded(!rollSucceeded)}
                    disabled={isSubmitting}
                  />
                  {' Success'}
                </Label>
              </FormGroup>
            </Col>
            <Col md={9}>
              <FormGroup>
                <Label for={rollCommentId}>Comments</Label>
                <Input
                  type="textarea"
                  maxLength={200}
                  name="comments"
                  id={rollCommentId}
                  value={rollComment}
                  onChange={e => setRollComment(e.target.value)}
                  disabled={isSubmitting}
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
                        <Button szie="sm" type="button" onClick={onAddDamageRollClick} disabled={isSubmitting}>
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
                          <Button size="sm" type="button" onClick={_ => removeDamageRollAt(i)} disabled={isSubmitting}>
                            {'Remove'}
                          </Button>
                        </td>
                        <td>
                          <Input
                            type="select"
                            name={getInputId(formId, `damageDieType-${i}`)}
                            value={d.numberOfSides}
                            onChange={e => updateDamageDieAt(i, parseInt(e.target.value), d.result)}
                            disabled={isSubmitting}
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
                            disabled={isSubmitting}
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
          {isSubmitting && <Spinner size="sm" color="primary" />}
        </CardFooter>
      </Form>
    </Card>
  );
};

export default AddRollForm;