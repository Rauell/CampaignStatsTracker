import React from 'react';
import { Route, Switch } from 'react-router';
// import { Fade } from 'react-router-bootstrap';
import { Layout } from './components/Layout';
import { Home } from './components/Home';
import CampaignListingPage from './pages/CampaignListingPage';
import CampaignPage from './components/CampaignPage';
import Routes from './Routes';

import './custom.css';

const App = () => (
  <Layout>
    {/* <Fade> */}
    <Switch>
      <Route exact path="/" component={Home} />
      <Route path={Routes.campaign} component={CampaignPage} />
      <Route exact path={Routes.campaignListing} component={CampaignListingPage} />
    </Switch>
    {/* </Fade> */}
  </Layout>
);

export default App;
