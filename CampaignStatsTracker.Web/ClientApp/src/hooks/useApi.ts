import { useState, useEffect } from 'react';

const useApi = (
  onResponse: (response: Response) => void,
  url: RequestInfo,
  opts?: RequestInit
) => {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    setIsLoading(true);

    fetch(url, opts)
      .then(response => {
        setIsLoading(false);
        onResponse(response);
      })
      .catch(error => {
        setIsLoading(false);
        setError(error);
      })
  }, [url]);

  return { isLoading, error };
};

export const useApiJsonResponse = (
  useData: (data: any) => void,
  url: RequestInfo,
  opts?: RequestInit
) => useApi(
  response => response.json().then(useData),
  url,
  opts
);

export default useApi;
