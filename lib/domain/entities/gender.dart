enum Gender { male, female }

Gender genderFromString(String source) {
  return Gender.values.firstWhere(
    (gender) => gender.name == source,
  );
}
