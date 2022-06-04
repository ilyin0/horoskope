import 'package:horoskope/domain/entities/friend_data.dart';

class CompatibilityState {
  final List<FriendData>? friends;

  CompatibilityState({
    this.friends,
  });

  CompatibilityState copyWith({
    List<FriendData>? friends,
  }) {
    return CompatibilityState(
      friends: friends ?? this.friends,
    );
  }
}
