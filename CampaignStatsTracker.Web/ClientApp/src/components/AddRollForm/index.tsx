import React, { useState } from 'react';
import { Guid } from "guid-typescript";
import { Col, Row, Form, FormGroup, Label, Input, Button, Card, CardHeader, CardBody, CardFooter, Table, Spinner } from 'reactstrap';
// import { useApiJsonResponse } from '../../hooks/useApi';
// import LoadingSpinner from '../LoadingSpinner';
import { IPublicEntity, IPublicEntityStats, IUser } from '../../types';
import AddDamageDice, { IDamageRoll } from './AddDamageDice';
import CharacterSelect from './CharacterSelect';
import { tryParseInt } from '../../utilities';
import ModifierInput from './Inputs/ModifierInput';

interface IProps {
  formId?: string,
  entities?: IPublicEntity[],
  onSubmitSuccess?: (newStats: IPublicEntityStats[]) => void,
  characters?: IUser[],
}

const rollTypes = [
  'Skill',
  'Attack'
];


const formColumnSizes = { xs: 6, sm: 4, md: 3 };

const getInputId = (id: string, formId: string) => `${formId}-${id}`;

const AddRollForm = (props: IProps) => {
  const { formId = '', entities = [], onSubmitSuccess, characters } = props;
  const isLoading = false;

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [rollType, setRollType] = useState(rollTypes[0]);
  const [rollValue, setRollValue] = useState(1);
  const [skillType, setSkillType] = useState('');
  const [rollModifier, setRollModifier] = useState(0);
  const [rollComment, setRollComment] = useState('');
  const [rollSucceeded, setRollSucceeded] = useState(false);
  const [selectedCharacterId, setSelectedCharacterId] = useState<Guid>(Guid.createEmpty());

  const [damageRolls, setDamageRolls] = useState<IDamageRoll[]>([{ numberOfSides: 6, result: 1 }]);
  const [damageModifier, setDamageModifier] = useState(0);


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

    if (selectedCharacterId.toString() !== Guid.EMPTY) entitiesToUse.push({ publicId: selectedCharacterId.toString() });

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
            damageModifier,
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

  const damageProps = {
    setDamageModifier,
    damageModifier,
    damageRolls,
    setDamageRolls,
    disabled: isSubmitting,
  };

  return (
    <Card>

      <CardHeader>
        {'Add a Roll'}
      </CardHeader>

      <Form id={formId} onSubmit={onSubmit}>
        <CardBody>
          <CharacterSelect
            characters={characters}
            disabled={isSubmitting}
            onChange={setSelectedCharacterId}
          />
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
              </FormGroup>
            </Col>

            <Col {...formColumnSizes}>
              <FormGroup>
                <Label for={rollModifiersId}>Modifier</Label>
                <ModifierInput
                  modifier={rollModifier}
                  onChange={setRollModifier}
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
          {rollType === 'Attack' && rollSucceeded && <AddDamageDice {...damageProps} />}
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