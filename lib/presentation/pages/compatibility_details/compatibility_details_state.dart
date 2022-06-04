import 'package:equatable/equatable.dart';
import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/friend_data.dart';

class CompatibilityDetailsState extends Equatable {
  final CompatibilityDetailsTab tab;
  final Compatibility? compatibility;
  final FriendData? friendData;

  const CompatibilityDetailsState({
    this.compatibility,
    this.tab = CompatibilityDetailsTab.romantic,
    this.friendData,
  });

  CompatibilityDetailsState copyWith({
    CompatibilityDetailsTab? tab,
    Compatibility? compatibility,
    FriendData? friendData,
  }) {
    return CompatibilityDetailsState(
      tab: tab ?? this.tab,
      compatibility: compatibility ?? this.compatibility,
      friendData: friendData ?? this.friendData,
    );
  }

  @override
  List<Object?> get props => [tab, compatibility, friendData];
}

enum CompatibilityDetailsTab {
  romantic,
  friendship,
}

extension CompatibilityDetailsStateExt on CompatibilityDetailsState {
  int? get compatibilityRate {
    switch (tab) {
      case CompatibilityDetailsTab.friendship:
        return compatibility?.frienshipCompatibilityRate;
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
