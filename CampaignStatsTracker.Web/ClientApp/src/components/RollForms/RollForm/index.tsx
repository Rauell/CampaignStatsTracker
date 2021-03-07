import React, { useState, ComponentProps } from 'react';
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
import { AttackRollFormBody } from '../AttackRollForm';
import { DamageRollFormBody } from '../DamageRollForm';
import { InitiatveRollFormBody } from '../InitiativeRollForm';
import { SavingThrowRollFormBody } from '../SavingThrowRollForm';
import { SkillRollFormBody } from '../SkillRollForm';
import {
  RollSuccessOptions,
  rollSuccessOptionAsBool,
  CharacterSelectInput,
} from '../Inputs';
import { tryParseInt } from '../../../utilities';

type RollFormBodyProps =
  ComponentProps<typeof CharacterSelectInput> &
  ComponentProps<typeof AttackRollFormBody> &
  ComponentProps<typeof DamageRollFormBody> &
  ComponentProps<typeof InitiatveRollFormBody> &
  ComponentProps<typeof SavingThrowRollFormBody> &
  ComponentProps<typeof SkillRollFormBody>;

type RollFormNonDataProps =
  'characters' |
  'onAttributeTypeInputChange' |
  'onCharacterSelectInputChange' |
  'onDamageTypeInputChange' |
  'onModifierInputChange' |
  'onMultiDieRollValuesChange' |
  'onRankInputChange' |
  'onRollValueInputChange' |
  'onRollSuccessInputChange' |
  'onSkillTypeInputChange';

type RollFormDataProps = Omit<RollFormBodyProps, RollFormNonDataProps>;

export type RollFormProps = Partial<Pick<ComponentProps<typeof CharacterSelectInput>, 'characters'>> & {
  associatedEntities?: Guid[]
  onSubmitSuccess?: () => Promise<void>
};

const defaultRollFormData: RollFormDataProps = {
  attributeType: 'Strength',
  characterId: Guid.createEmpty(),
  damageType: '',
  disabled: false,
  modifier: 0,
  multiDieRollValues: [],
  rank: 1,
  rollSuccess: RollSuccessOptions.None,
  rollValue: '',
  skillType: '',
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
  {
    name: 'Saving Throw',
    apiUrl: '/api/roll/saving',
    component: SavingThrowRollFormBody,
  },
];

const submitAddRoll = async (
  formType: RollFormType,
  formData: RollFormDataProps,
  associatedEntities: Guid[],
) => {
  const {
    attributeType,
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
      attributeType,
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
    onAttributeTypeInputChange: (attributeType) => setFormData({ ...formData, attributeType }),
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
