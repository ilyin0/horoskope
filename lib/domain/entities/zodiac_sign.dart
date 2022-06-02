enum ZodiacSign {
  aries,
  taurus,
  gemini,
  cancer,
  leo,
  virgo,
  libra,
  scorpio,
  sagittarius,
  capricorn,
  aquarius,
  pisces,
}

ZodiacSign zodiacSignFromString(String source) {
  return ZodiacSign.values.firstWhere(
    (sign) => sign.name == source,
  );
}
