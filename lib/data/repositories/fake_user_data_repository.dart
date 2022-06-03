import 'package:horoskope/domain/entities/geo.dart';
import 'package:horoskope/domain/entities/user_data.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';

class FakeUserDataRepository {
  @override
  Future<UserData> getUserData() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => UserData(
        id: '0',
        name: 'Alex',
        birthDateTime: DateTime(2000, 11, 7),
        birthPlace: Geo(latitude: '', longitude: ''),
      ),
    );
  }

  @override
  void setUserData(UserData userData) {
    // TODO: implement setUserData
  }

  @override
  // TODO: implement userDataStream
  Stream<UserData?>? get userDataStream => throw UnimplementedError();
}
