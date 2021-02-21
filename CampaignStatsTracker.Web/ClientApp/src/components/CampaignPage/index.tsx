import React, { useState } from 'react';
import { useParams } from 'react-router';
import { Guid } from 'guid-typescript';
import { ICampaignStats } from '../../types';
import useApi from '../../hooks/useApi';
import CampaignPageDetails from './CampaignPageDetails';

interface IParams {
  campaignId: string;
}

const CampaignPage = () => {
  const { campaignId } = useParams<IParams>();
  const campaignDataUri = `/api/campaign/${campaignId}`;
  const [campaign, setCampaign] = useState<ICampaignStats | null>(null);

  const handleDataLoad = (response: Response) => {
    if (response.ok) response.json().then(setCampaign);
    // else setUseListingPage(true);
  };

  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  const { isLoading: isLoadingInitial } = useApi({
    onResponse: handleDataLoad,
    url: campaignDataUri,
  });

  const refreshStats = async () => {
    const response = await fetch(campaignDataUri);
    const data = await response.json();
    setCampaign(data);
  };

  if (!campaign) return null;

  return (
    <CampaignPageDetails
      refreshStats={refreshStats}
      campaignId={Guid.parse(campaignId)}
      campaignStats={campaign}
    />
  );
};

export default CampaignPage;
