import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { generatePath } from 'react-router';
import { Container, ListGroup, ListGroupItem } from 'reactstrap';
import LoadingSpinner from '../LoadingSpinner';
import useApi from '../../hooks/useApi';
import { ICampaign } from '../../types';
import Routes from '../../Routes';

const CampaignListingPage = () => {
  const [campaigns, setCampaigns] = useState<ICampaign[]>([]);
  const temp = (data: ICampaign[]) => {
    console.log(data);
    setCampaigns(data);
  }
  const { isLoading } = useApi(
    response => response.json().then(temp),
    "/api/campaign/list"
  );

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
      <h1>Campaigns</h1>
      <LoadingSpinner isLoading={isLoading}>
        <ListGroup>
          {campaignList}
        </ListGroup>
      </LoadingSpinner>
    </Container>
  );
}

export default CampaignListingPage;
