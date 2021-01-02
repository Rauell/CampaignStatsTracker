type QueryArgs = { [field: string]: [string | string[] | number[] | boolean[]] };
export const appendQueryArgs = (path: string, queryArgs?: QueryArgs) => {
  const loopArgs = queryArgs || {};
  const queryParameters = Object.keys(loopArgs)
    .map(key => {
      const rawValue = loopArgs[key];
      let value: string;

      if (Array.isArray(rawValue)) value = rawValue.join(',');
      else value = rawValue as string;

      return `${key}=${value}`;
    });

  let route = path;
  if (queryParameters.length) route += `?${queryParameters.join('&')}`;

  return route;
}

const Routes = {
  getCampaignListing: () => '/campaign',
  getCampaign: (id: string) => `/campaign/${id}`,
  campaignListing: '/campaign',
  campaign: '/campaign/:campaignId',
};

export default Routes;