import React, { useState } from 'react';
import {
  Row, Col, TabContent, TabPane, Nav, NavItem, NavLink,
} from 'reactstrap';
import { Guid } from 'guid-typescript';
import classnames from 'classnames';
import { ICampaignStats } from '../../types';
import StatsTable from '../Stats/StatsTable';
import RollTable from '../RollTable';
import RollForm from '../RollForms/RollForm';

export type CampaignPageDetailsProps = {
  campaignId: Guid;
  campaignStats: ICampaignStats;
  refreshStats?: () => Promise<void>;
};

type TabOption = 'Overview' | 'Add Rolls' | 'Statistics';
type TabMetaData = {
  title: TabOption;
};

const OverviewTab: TabMetaData = {
  title: 'Overview',
};

const AddRollsTab: TabMetaData = {
  title: 'Add Rolls',
};

const tabMetaData: TabMetaData[] = [
  OverviewTab,
  AddRollsTab,
  {
    title: 'Statistics',
  },
];

const CampaignPageDetails = (props: CampaignPageDetailsProps) => {
  const { campaignStats, refreshStats } = props;

  const [activeTabTitle, setActiveTabTitle] = useState<TabOption>(tabMetaData[0].title);

  const toggleTab = (tab: TabMetaData) => {
    if (tab.title !== activeTabTitle) setActiveTabTitle(tab.title);
  };

  return (
    <>
      <Row>
        <Col>
          <h1>{campaignStats.name}</h1>
        </Col>
      </Row>

      <Row>
        <Col>
          <Nav tabs>
            {tabMetaData.map((t) => (
              <NavItem key={t.title}>
                <NavLink
                  className={classnames({ active: activeTabTitle === t.title })}
                  onClick={() => toggleTab(t)}
                >
                  {t.title}
                </NavLink>
              </NavItem>
            ))}
          </Nav>
        </Col>
      </Row>

      <Row>
        <Col>
          <StatsTable stats={campaignStats} />
        </Col>
      </Row>

      <Row>
        <Col>
          <TabContent activeTab={activeTabTitle}>
            <TabPane tabId={OverviewTab.title} style={{ marginTop: '1rem' }}>
              <Row>
                <Col>
                  <RollTable rolls={campaignStats.latestRolls} />
                </Col>
              </Row>
            </TabPane>
            <TabPane tabId={AddRollsTab.title}>
              <Row>
                <Col>
                  <RollForm
                    onSubmitSuccess={refreshStats}
                    associatedEntities={[Guid.parse(campaignStats.publicId)]}
                    characters={campaignStats.characters.map(
                      (c) => ({ id: Guid.parse(c.publicId), name: c.name }),
                    )}
                  />
                </Col>
              </Row>
            </TabPane>
            <TabPane />
          </TabContent>
        </Col>
      </Row>
    </>
  );
};

export default CampaignPageDetails;
