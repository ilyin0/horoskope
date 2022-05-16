import 'package:horoskope/domain/entities/user_data.dart';
import 'package:horoskope/domain/entities/zodiac_signs.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';

class FakeUserDataRepository implements UserDataRepository {
  @override
  Future<UserData> getUserData() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => UserData(
        id: 1,
        name: 'Alex',
        zodiacSign: ZodiacSign.taurus,
      ),
    );
  }
}
