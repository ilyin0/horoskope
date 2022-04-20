class Compatibility {
  final String name;
  final String? shortDescription;
  final int romanticCompatibility;
  final int friendshipCompatibility;
  final Map<String, String> compatibilityItems;

  Compatibility({
    required this.name,
    required this.romanticCompatibility,
    required this.friendshipCompatibility,
    required this.compatibilityItems,
    this.shortDescription,
  });
}
