import React, { useState } from 'react';
import { useParams, } from 'react-router';
import { Container, Row, Col, Alert } from 'reactstrap';
import LoadingSpinner from '../LoadingSpinner';
import useApi from '../../hooks/useApi';
import { ICampaignStats } from '../../types';
import StatsTable from '../Stats/StatsTable';
import AddRollForm from '../AddRollForm';
import { IPublicEntityStats, IPublicEntity } from '../../types';
import CampaignListingPage from '../CampaignListingPage';

interface IParams {
  campaignId: string;
}

const CampaignPage = () => {
  const { campaignId } = useParams<IParams>();
  const campaignDataUri = `/api/campaign/${campaignId}`;
  const [campaign, setCampaign] = useState<ICampaignStats | null>(null);
  const [useListingPage, setUseListingPage] = useState(false);
  const [isLoadingRefresh, setIsLoadingRefresh] = useState(false);

  let associableEntitites: IPublicEntity[] = [];
  if (campaign) {
    associableEntitites.push(campaign);
    if (campaign.characters) associableEntitites = associableEntitites.concat(campaign.characters);
  }

  const handleDataLoad = (response: Response) => {
    if (response.ok) response.json().then(setCampaign);
    else setUseListingPage(true);
  }

  const { isLoading: isLoadingInitial } = useApi({
    onResponse: handleDataLoad,
    url: campaignDataUri,
  });
  // const refreshData = async () => {
  //   const response = await fetch(campaignDataUri);
  //   const data = await response.json();
  //   setCampaign(data);
  // }

  const onNewDieResult = (newStats: IPublicEntityStats[]) => {
    if (campaign) {
      const newCampaignStats = newStats.filter(s => s.publicId === campaign?.publicId)[0];
      setCampaign({
        ...campaign,
        stats: { ...newCampaignStats.stats }
      });
    }
  };

  return (
    <Container>
      <LoadingSpinner isLoading={isLoadingInitial}>
        {!campaign ?
          <>
            <p>Not Found! Go back to campiagn page.</p>
            {/* <CampaignListingPage errorMessage="The requested campaign could not be found." /> */}
          </> :
          <>
            <Row>
              <Col>
                <h1>{campaign.name}</h1>
              </Col>
            </Row>

            <hr />

            <Row>
              <Col>
                <h2>Campaign Stats</h2>
                {/* <Button type="button" onClick={refreshData}>Refresh</Button> */}
              </Col>
            </Row>

            <Row>
              <Col>
                <LoadingSpinner isLoading={isLoadingRefresh}>
                  <StatsTable stats={campaign} />
                </LoadingSpinner>
              </Col>
            </Row>
            <hr />
            <Row>
              <Col>
                <AddRollForm entities={[campaign]} characters={campaign.characters} onSubmitSuccess={onNewDieResult} />
              </Col>
            </Row>

            {campaign.users &&
              <Row>
                <Col>
                  <LoadingSpinner isLoading={isLoadingRefresh}>
                    <StatsTable stats={campaign.users} />
                  </LoadingSpinner>
                </Col>
              </Row>
            }

          </>
        }
      </LoadingSpinner>
    </Container>
  );
}

export default CampaignPage;
