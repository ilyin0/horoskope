import 'package:horoskope/domain/entities/user_data.dart';

abstract class UserDataRepository {
  Future<UserData> getUserData();
}
