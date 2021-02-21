// eslint-disable-next-line import/prefer-default-export
export const tryParseInt = (text: string | number, defaultValue: number = 0) => {
  if (typeof (text) === 'number') return text;
  if (text && text.length) {
    const attempt = parseInt(text, 10);
    if (!Number.isNaN(attempt)) return attempt;
  }
  return defaultValue;
};
