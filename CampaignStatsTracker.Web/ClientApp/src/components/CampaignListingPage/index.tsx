import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { generatePath } from 'react-router';
import { Container, ListGroup, ListGroupItem, Row, Col, Alert } from 'reactstrap';
import LoadingSpinner from '../LoadingSpinner';
import { useApiJsonResponse } from '../../hooks/useApi';
import { ICampaign } from '../../types';
import Routes from '../../Routes';

interface IProps {
  errorMessage?: string
}

const CampaignListingPage = (props: IProps) => {
  const { errorMessage } = props;
  const [campaigns, setCampaigns] = useState<ICampaign[]>([]);
  const { isLoading } = useApiJsonResponse({ onSuccess: setCampaigns, url: '/api/campaign/list' });

  const campaignList = campaigns.map(c => (
    <ListGroupItem
      className="justify-content-between"
      key={c.publicId}
      tag={Link}
      to={generatePath(Routes.campaign, { campaignId: c.publicId })}
    >
      {c.name}
    </ListGroupItem>
  ));

  return (
    <Container>
      <Row>
        <Col>
          <h1>Campaigns</h1>
        </Col>
      </Row>
      {errorMessage &&
        <Row>
          <Col>
            <Alert color="warning">{errorMessage}  </Alert>
          </Col>
        </Row>
      }
      <Row>
        <Col>
          <LoadingSpinner isLoading={isLoading}>
            <ListGroup>
              {campaignList}
            </ListGroup>
          </LoadingSpinner>
        </Col>
      </Row>
    </Container >
  );
}

export default CampaignListingPage;
