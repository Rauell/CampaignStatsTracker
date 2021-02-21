/* eslint-disable react/prop-types */
/* eslint-disable react/destructuring-assignment */
/* eslint-disable react/jsx-filename-extension */
/* eslint-disable react/static-property-placement */
/* eslint-disable react/prefer-stateless-function */
/* eslint-disable import/prefer-default-export */
import React, { Component } from 'react';
import { Container } from 'reactstrap';
import { NavMenu } from './NavMenu';

export class Layout extends Component {
  static displayName = Layout.name;

  render() {
    return (
      <div>
        <NavMenu />
        <Container>{this.props.children}</Container>
      </div>
    );
  }
}
