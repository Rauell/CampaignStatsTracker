import React, { useState } from 'react';
import {
  Card,
  CardHeader,
  CardBody,
  CardFooter,
  Col,
  Row,
  Nav,
  NavItem,
  NavLink,
  TabContent,
  TabPane,
  Button,
} from 'reactstrap';
import { Guid } from 'guid-typescript';
import { AttackRollFormBody, AttackRollFormBodyProps } from '../AttackRollForm';
import { DamageRollFormBody, DamageRollFormBodyProps } from '../DamageRollForm';
import { InitiatveRollFormBody, InitiatveRollFormBodyProps } from '../InitiativeRollForm';
import { SkillRollFormBody, SkillRollFormBodyProps } from '../SkillRollForm';
import {
  RollSuccessOptions,
  rollSuccessOptionAsBool,
  CharacterSelectInput,
  CharacterSelectInputProps,
} from '../Inputs';
import { tryParseInt } from '../../../utilities';

type RollFormBodyProps =
  CharacterSelectInputProps &
  AttackRollFormBodyProps &
  DamageRollFormBodyProps &
  InitiatveRollFormBodyProps &
  SkillRollFormBodyProps;

type RollFormNonDataProps =
  'characters' |
  'onCharacterSelectInputChange' |
  'onDamageTypeInputChange' |
  'onModifierInputChange' |
  'onMultiDieRollValuesChange' |
  'onRankInputChange' |
  'onRollValueInputChange' |
  'onRollSuccessInputChange' |
  'onSkillTypeInputChange';

type RollFormDataProps = Omit<RollFormBodyProps, RollFormNonDataProps>;

export type RollFormProps = Partial<Pick<CharacterSelectInputProps, 'characters'>> & {
  associatedEntities?: Guid[]
  onSubmitSuccess?: () => Promise<void>
};

const defaultRollFormData: RollFormDataProps = {
  damageType: '',
  disabled: false,
  modifier: 0,
  rollSuccess: RollSuccessOptions.None,
  rollValue: '',
  skillType: '',
  rank: 1,
  multiDieRollValues: [],
  characterId: Guid.createEmpty(),
};

type RollFormType = {
  name: string;
  apiUrl: string;
  component: (props: any) => JSX.Element;
};

const rollTypes: RollFormType[] = [
  {
    name: 'Skill Roll',
    apiUrl: '/api/roll/skill',
    component: SkillRollFormBody,
  },
  {
    name: 'Attack Roll',
    apiUrl: '/api/roll/attack',
    component: AttackRollFormBody,
  },
  {
    name: 'Damage Roll',
    apiUrl: '/api/roll/damage',
    component: DamageRollFormBody,
  },
  {
    name: 'Initiative Roll',
    apiUrl: '/api/roll/initiative',
    component: InitiatveRollFormBody,
  },
];

const submitAddRoll = async (
  formType: RollFormType,
  formData: RollFormDataProps,
  associatedEntities: Guid[],
) => {
  const {
    characterId,
    damageType,
    modifier,
    multiDieRollValues,
    rank,
    rollSuccess,
    rollValue,
    skillType,
  } = formData;

  return fetch(formType.apiUrl, {
    method: 'POST',
    headers: new Headers({ 'content-type': 'application/json' }),
    body: JSON.stringify({
      damageType,
      modifier,
      rank: tryParseInt(rank),
      rollSuccess: rollSuccessOptionAsBool(rollSuccess),
      rollValue: tryParseInt(rollValue),
      rollValues: multiDieRollValues.map((m) => ({
        dieType: m.dieType,
        values: m.values,
      })),
      skillType,
      associatedEntities: [
        ...associatedEntities,
        characterId,
      ].map((a) => a.toString())
        .filter((a) => a !== Guid.EMPTY),
    }),
  });
};

const RollForm = (props: RollFormProps) => {
  const {
    characters = [],
    associatedEntities = [],
    onSubmitSuccess,
  } = props;
  const [currentFormType, setCurrentFormType] = useState<RollFormType>(rollTypes[0]);
  const [formData, setFormData] = useState<RollFormDataProps>(defaultRollFormData);
  const [isSubmitting, setIsSubmitting] = useState(false);

  const onNavClick = (formType: RollFormType) => {
    if (formType.name !== currentFormType.name) setCurrentFormType(formType);
  };

  const onSubmit = async () => {
    try {
      setIsSubmitting(true);
      await submitAddRoll(currentFormType, formData, associatedEntities);
      if (onSubmitSuccess) await onSubmitSuccess();
    } catch (error) {
      // eslint-disable-next-line no-alert
      alert(error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const formBodyProps: RollFormBodyProps = {
    ...formData,
    characters,
    disabled: isSubmitting,
    onDamageTypeInputChange: (damageType) => setFormData({ ...formData, damageType }),
    onCharacterSelectInputChange: (characterId) => setFormData({ ...formData, characterId }),
    onModifierInputChange: (modifier) => setFormData({ ...formData, modifier }),
    onMultiDieRollValuesChange: (multiDieRollValues) => setFormData({
      ...formData,
      multiDieRollValues,
    }),
    onRankInputChange: (rank) => setFormData({ ...formData, rank }),
    onRollValueInputChange: (rollValue) => setFormData({ ...formData, rollValue }),
    onRollSuccessInputChange: (rollSuccess) => setFormData({ ...formData, rollSuccess }),
    onSkillTypeInputChange: (skillType) => setFormData({ ...formData, skillType }),
  };

  return (
    <>
      <Row>
        <Col>
          <Card>
            <CardHeader>
              <Nav tabs card>
                {rollTypes.map((t) => (
                  <NavItem key={t.name}>
                    <NavLink
                      onClick={() => onNavClick(t)}
                      active={currentFormType.name === t.name}
                    >
                      {t.name}
                    </NavLink>
                  </NavItem>
                ))}
              </Nav>
            </CardHeader>
            <CardBody>
              {characters?.length > 0 && <CharacterSelectInput {...formBodyProps} />}
              <TabContent activeTab={currentFormType.name}>
                {rollTypes.map((t) => (
                  <TabPane key={t.name} tabId={t.name}>
                    {t.component(formBodyProps)}
                  </TabPane>
                ))}
              </TabContent>
            </CardBody>
            <CardFooter>
              <Button onClick={onSubmit}>
                Add Roll
              </Button>
            </CardFooter>
          </Card>
        </Col>
      </Row>
    </>
  );
};

export default RollForm;
