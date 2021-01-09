export const tryParseInt = (text: string, defaultValue: number) => {
  if (text && text.length) {
    const attempt = parseInt(text);
    if (!isNaN(attempt)) return attempt;
  }
  return defaultValue;
}
