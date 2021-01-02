import React from 'react';
import { Spinner } from 'reactstrap';

interface IProps {
  isLoading: boolean;
}

const LoadingSpinner = (props: React.PropsWithChildren<IProps>) => {
  const { children, isLoading } = props;


  if (!isLoading) {
    return <>{children}</>;
  }

  return (<Spinner color="primary">Loading...</Spinner>);
};

export default LoadingSpinner;
