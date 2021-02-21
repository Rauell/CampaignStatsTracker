import React from 'react';
import { Story, Meta } from '@storybook/react';
import { Guid } from 'guid-typescript';
import CampaignPageDetails, { CampaignPageDetailsProps } from './CampaignPageDetails';

export default {
  title: 'Pages/Campaigns/Details',
  component: CampaignPageDetails,
  args: {
    campaignId: Guid.EMPTY,
    campaignStats: {
      name: 'Example Campaign',
      latestRolls: [],
      stats: {
        skill: {
          average: 0,
          successRate: 0,
          criticalSuccessRate: 0,
          criticalFailureRate: 0,
        },
        damage: {
          average: 0,
          successRate: 0,
        },
      },
    },
  },
} as Meta;

const Template: Story<CampaignPageDetailsProps> = (args) => <CampaignPageDetails {...args} />;

export const Default = Template.bind({});
