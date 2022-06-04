import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horoskope/data/providers/firestore_database_provider.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/repositories/user_friends_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUserFriendsRepository implements UserFriendsRepository {
  final AuthService _authService;

  FirebaseUserFriendsRepository(this._authService) {
    _init();
  }

  StreamSubscription? _subscription;
  final _userFriendsSubject = BehaviorSubject<List<FriendData>?>();

  @override
  Stream<List<FriendData>?> get userFriendsStream => _userFriendsSubject.stream;
  @override
  List<FriendData>? get friendsList => _userFriendsSubject.valueOrNull;

  void _init() {
    _subscription =
        _authService.authUserStream.switchMap<List<FriendData>?>((user) {
      final uid = user?.uid;
      if (uid == null) return Stream<List<FriendData>?>.value(null);

      final ref = _getFriendsCollectionRef(uid);
      return ref.snapshots().map((snapshot) {
        final friends = <FriendData>[];
        for (final doc in snapshot.docs) {
          friends.add(FriendData.fromSnapshot(doc));
        }
        return friends;
      });
    }).listen((friendsList) => _userFriendsSubject.add(friendsList));
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  @override
  Future<bool> addFriend(FriendData friendData) async {
    try {
      await _reference.add(friendData.toJson());
      return true;
    } catch (_) {
      return false;
    }
  }

  CollectionReference<Map<String, dynamic>> _getFriendsCollectionRef(
    String uid,
  ) =>
      FirestoreDatabaseProvider.db
          .collection('friends')
          .doc('friends')
          .collection(uid);

  CollectionReference<Map<String, dynamic>> get _reference =>
      _getFriendsCollectionRef(_authService.currentUser!.uid);
}
