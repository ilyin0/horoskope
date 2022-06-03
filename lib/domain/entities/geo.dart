class Geo {
  final String latitude;
  final String longitude;

  const Geo({
    required this.latitude,
    required this.longitude,
  });

  const Geo.zero()
      : latitude = '0.0',
        longitude = '0.0';
}
