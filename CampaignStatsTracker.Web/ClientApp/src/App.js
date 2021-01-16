import React, { Component } from 'react';
import { Route, Switch } from 'react-router';
// import { Fade } from 'react-router-bootstrap';
import { Layout } from './components/Layout';
import { Home } from './components/Home';
import { FetchData } from './components/FetchData';
import { Counter } from './components/Counter';
import CampaignListingPage from './components/CampaignListingPage';
import CampaignPage from './components/CampaignPage';
import Routes from './Routes';

import './custom.css'

export default class App extends Component {
  static displayName = App.name;

  render() {
    return (
      <Layout>
        {/* <Fade> */}
        <Switch>
          <Route exact path='/' component={Home} />
          <Route path='/counter' component={Counter} />
          <Route path='/fetch-data' component={FetchData} />
          <Route path={Routes.campaign} component={CampaignPage} />
          <Route exact path={Routes.getCampaignListing()} component={CampaignListingPage} />
        </Switch>
        {/* </Fade> */}
      </Layout>
    );
  }
}
