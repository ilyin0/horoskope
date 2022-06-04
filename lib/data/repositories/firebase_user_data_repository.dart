import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horoskope/data/providers/firestore_database_provider.dart';
import 'package:horoskope/domain/entities/user_data.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseUserDataRepository implements UserDataRepository {
  final AuthService _authService;

  FirebaseUserDataRepository(this._authService) {
    _init();
  }

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      FirestoreDatabaseProvider.db.collection('users');

  StreamSubscription? _subscription;
  final _userDataSubject = BehaviorSubject<UserData?>();

  @override
  Stream<UserData?> get userStream => _userDataSubject.stream;
  @override
  UserData? get userData => _userDataSubject.valueOrNull;

  void _init() {
    _subscription = _authService.authUserStream.switchMap<UserData?>((user) {
      final uid = user?.uid;
      if (uid == null) return Stream<UserData?>.value(null);

      final ref = _getUserDocRef(uid);
      return ref.snapshots().map((snapshot) {
        final json = snapshot.data();
        if (json == null) return null;

        final userData = UserData.fromJson(json);
        return userData;
      });
    }).listen((user) => _userDataSubject.add(user));
  }

  @override
  void dispose() {
    _subscription?.cancel();
  }

  DocumentReference<Map<String, dynamic>> get _reference =>
      _getUserDocRef(_authService.currentUser!.uid);

  Future<UserData> loadUserData() async {
    final snapshot = await _reference.get();
    final json = snapshot.data()!;
    final userData = UserData.fromJson(json);
    _userDataSubject.add(userData);
    return userData;
  }

  Future<void> saveUserData(UserData userData) async {
    await _reference.set(
      userData.toJson(),
      SetOptions(merge: true),
    );
  }

  DocumentReference<Map<String, dynamic>> _getUserDocRef(String uid) =>
      FirestoreDatabaseProvider.db.doc('users/$uid');

  @override
  Future<UserData?> getUserData() async {
    final userId = _authService.currentUser?.uid;

    if (userId != null) {
      final userDoc = await _usersCollection.doc(userId).get();

      final userDataJson = userDoc.data();
      if (userDataJson != null) {
        return UserData.fromJson(userDataJson);
      }
    }

    return null;
  }

  @override
  void setUserData(UserData userData) {
    _usersCollection.doc(userData.id.toString()).set(userData.toJson());
  }
}
