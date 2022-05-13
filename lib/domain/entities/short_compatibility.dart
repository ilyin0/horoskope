class ShortCompatibility {
  final int id;
  final String name;
  final int romanticCompatibility;
  final String? shortDescription;

  const ShortCompatibility({
    required this.id,
    required this.name,
    required this.romanticCompatibility,
    this.shortDescription,
  });
}
