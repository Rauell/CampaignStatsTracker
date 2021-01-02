import React, { useState } from 'react';
import { useParams, } from 'react-router';
import { Container, Row, Col } from 'reactstrap';
import LoadingSpinner from '../LoadingSpinner';
import { useApiJsonResponse } from '../../hooks/useApi';
import { ICampaignStats } from '../../types';
import StatsTable from '../Stats/StatsTable';
import AddRollForm from '../AddRollForm';

const noContentFound = (
  <span>No contentFound</span>
);

interface IParams {
  campaignId: string;
}

const CampaignPage = () => {
  const { campaignId } = useParams<IParams>();
  const [campaign, setCampaign] = useState<ICampaignStats | null>(null);
  const { isLoading } = useApiJsonResponse(
    setCampaign,
    `/api/campaign/${campaignId}`,
  );

  return (
    <Container>
      <LoadingSpinner isLoading={isLoading}>
        {!campaign ?
          noContentFound :
          <>
            <Row>
              <Col>
                <h1>Campaign: {campaign.name}</h1>
              </Col>
            </Row>
            <Row>
              <Col>
                <AddRollForm entities={[campaign]} />
              </Col>
            </Row>
            <hr />
            <br />
            <Row>
              <Col>
                <h2>Campaign Stats</h2>
                <StatsTable stats={campaign} />
              </Col>
            </Row>
            {campaign.users && <StatsTable stats={campaign.users} />}
          </>
        }
      </LoadingSpinner>
    </Container>
  );
}

export default CampaignPage;
