import 'package:horoskope/domain/entities/zodiac_signs.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';

class FakeHoroskopeRepository implements HoroskopeRepository {
  @override
  Future<String> getTodayForecast({
    required ZodiacSign sign,
    required DateTime dateTime,
  }) {
    return Future.delayed(
      const Duration(seconds: 3),
      () =>
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl. Sed laoreet mattis auctor. Integer at massa non lectus aliquam vulputate. Duis mattis libero eu libero dictum aliquet. Phasellus luctus nunc eget convallis elementum. Nunc commodo eros non sagittis venenatis. Phasellus et lacus nisl. Pellentesque semper dolor quis dolor quis',
    );
  }
}
