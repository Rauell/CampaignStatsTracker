import { useState, useEffect } from 'react';

type ResponseHandler = (response: Response) => void;

interface IBaseProps {
  url: RequestInfo,
  opts?: RequestInit,
}

interface IApiProps extends IBaseProps {
  onResponse?: ResponseHandler,
}

const useApi = (props: IApiProps) => {
  const { onResponse, url, opts } = props;
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    setIsLoading(true);

    fetch(url, opts)
      .then((response) => {
        setIsLoading(false);
        if (onResponse) onResponse(response);
      })
      .catch((fetchError) => {
        setIsLoading(false);
        setError(fetchError);
      });
  }, [url]);

  return { isLoading, error };
};

interface IJsonProps extends IBaseProps {
  onSuccess?: (data: any) => void,
}

export const useApiJsonResponse = (props: IJsonProps) => {
  const { onSuccess, ...apiProps } = props;
  return useApi({
    onResponse: (response: Response) => response.json().then(onSuccess),
    ...apiProps,
  });
};

export default useApi;
