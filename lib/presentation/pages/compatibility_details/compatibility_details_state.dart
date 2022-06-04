import 'package:equatable/equatable.dart';
import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/entities/user_data.dart';

class CompatibilityDetailsState extends Equatable {
  final CompatibilityDetailsTab tab;
  final Compatibility? compatibility;
  final UserData? userData;
  final FriendData? friendData;

  const CompatibilityDetailsState({
    this.compatibility,
    this.tab = CompatibilityDetailsTab.romantic,
    this.friendData,
    this.userData,
  });

  CompatibilityDetailsState copyWith({
    CompatibilityDetailsTab? tab,
    Compatibility? compatibility,
    FriendData? friendData,
    UserData? userData,
  }) {
    return CompatibilityDetailsState(
      tab: tab ?? this.tab,
      compatibility: compatibility ?? this.compatibility,
      friendData: friendData ?? this.friendData,
      userData: userData ?? this.userData,
    );
  }

  @override
  List<Object?> get props => [
        tab,
        compatibility,
        friendData,
        userData,
      ];
}

enum CompatibilityDetailsTab {
  romantic,
  friendship,
}

extension CompatibilityDetailsStateExt on CompatibilityDetailsState {
  int? get compatibilityRate {
    switch (tab) {
      case CompatibilityDetailsTab.friendship:
        return compatibility?.friendshipCompatibilityRate;
      case CompatibilityDetailsTab.romantic:
        return compatibility?.romanticCompatibilityRate;
    }
  }

  Map<String, String>? get compatibilityDetails {
    switch (tab) {
      case CompatibilityDetailsTab.friendship:
        return compatibility?.friendshipCompatibilityItems;
      case CompatibilityDetailsTab.romantic:
        return compatibility?.romanticCompatibilityItems;
    }
  }
}
