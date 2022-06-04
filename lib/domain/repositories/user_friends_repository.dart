import 'package:horoskope/domain/entities/friend_data.dart';

abstract class UserFriendsRepository {
  Stream<List<FriendData>?> get userFriendsStream;
  List<FriendData>? get friendsList;
  Future<bool> addFriend(FriendData friendData);
  void dispose();
}
