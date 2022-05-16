import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/short_compatibility.dart';
import 'package:horoskope/domain/entities/zodiac_signs.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';

class FakeCompatibilityRepository implements CompatibilityRepository {
  final UserDataRepository _userDataRepository;

  const FakeCompatibilityRepository(this._userDataRepository);

  @override
  Future<List<ShortCompatibility>> getAllShortCompatibilities(int userId) {
    return Future.delayed(
      const Duration(seconds: 0),
      () => const [
        ShortCompatibility(
          id: 1,
          name: 'Alice',
          romanticCompatibility: 98,
        ),
        ShortCompatibility(
          id: 1,
          name: 'Kirstin',
          shortDescription: 'A twin flame',
          romanticCompatibility: 91,
        ),
        ShortCompatibility(
          id: 1,
          name: 'Ann',
          shortDescription: 'A perfect match',
          romanticCompatibility: 99,
        ),
      ],
    );
  }

  @override
  Future<Compatibility> getDetailedCompatibility({
    required int compatibilityId,
  }) async {
    final userData = await _userDataRepository.getUserData();

    return Compatibility(
      id: 1,
      userName: userData.name,
      userZodiacSign: userData.zodiacSign,
      partnerName: 'Alice',
      partnerZodiacSign: ZodiacSign.cancer,
      romanticCompatibilityRate: 78,
      frienshipCompatibilityRate: 64,
      romanticCompatibilityItems: {
        'Basic Identities':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl',
        'Emotional Styles':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus'
      },
      friendshipCompatibilityItems: {
        'Basic Identities':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus',
        'Emotional Styles':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl',
      },
    );
  }
}
