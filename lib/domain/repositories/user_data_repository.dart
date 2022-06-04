import 'package:horoskope/domain/entities/user_data.dart';

abstract class UserDataRepository {
  Future<UserData?> getUserData();
  void setUserData(UserData userData);
  Stream<UserData?> get userStream;
  UserData? get userData;
  void dispose();
}
