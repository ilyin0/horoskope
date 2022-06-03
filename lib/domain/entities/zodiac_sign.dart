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

ZodiacSign zodiacSignFromBirthDate(DateTime birthDate) {
  final date = birthDate.toZeroYear;

  if (date.isBetween(
    first: getZeroYear(1, 20),
    second: getZeroYear(2, 19),
  )) {
    return ZodiacSign.aquarius;
  }
  if (date.isBetween(
    first: getZeroYear(2, 19),
    second: getZeroYear(3, 21),
  )) {
    return ZodiacSign.pisces;
  }
  if (date.isBetween(
    first: getZeroYear(3, 21),
    second: getZeroYear(4, 20),
  )) {
    return ZodiacSign.aries;
  }
  if (date.isBetween(
    first: getZeroYear(4, 20),
    second: getZeroYear(5, 21),
  )) {
    return ZodiacSign.taurus;
  }
  if (date.isBetween(
    first: getZeroYear(5, 21),
    second: getZeroYear(6, 22),
  )) {
    return ZodiacSign.gemini;
  }
  if (date.isBetween(
    first: getZeroYear(6, 22),
    second: getZeroYear(7, 23),
  )) {
    return ZodiacSign.cancer;
  }
  if (date.isBetween(
    first: getZeroYear(7, 23),
    second: getZeroYear(8, 23),
  )) {
    return ZodiacSign.leo;
  }
  if (date.isBetween(
    first: getZeroYear(8, 23),
    second: getZeroYear(9, 23),
  )) {
    return ZodiacSign.virgo;
  }
  if (date.isBetween(
    first: getZeroYear(9, 23),
    second: getZeroYear(10, 24),
  )) {
    return ZodiacSign.libra;
  }
  if (date.isBetween(
    first: getZeroYear(10, 24),
    second: getZeroYear(11, 23),
  )) {
    return ZodiacSign.scorpio;
  }
  if (date.isBetween(
    first: getZeroYear(11, 23),
    second: getZeroYear(12, 22),
  )) {
    return ZodiacSign.sagittarius;
  }
  return ZodiacSign.capricorn;
}

DateTime getZeroYear(int month, int day) {
  return DateTime(0, month, day);
}

extension on DateTime {
  DateTime get toZeroYear {
    return DateTime(
      0,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  bool isBetween({
    required DateTime first,
    required DateTime second,
  }) {
    if (first.isAfter(second)) {
      final tmp = first;
      first = second;
      second = tmp;
    }
    return isAfter(first) && isBefore(second);
  }
}
