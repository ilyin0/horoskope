import 'package:equatable/equatable.dart';

class Compatibility extends Equatable {
  final int? romanticCompatibilityRate;
  final int? friendshipCompatibilityRate;
  final Map<String, String>? romanticCompatibilityItems;
  final Map<String, String>? friendshipCompatibilityItems;

  const Compatibility({
    this.romanticCompatibilityRate,
    this.friendshipCompatibilityRate,
    this.romanticCompatibilityItems,
    this.friendshipCompatibilityItems,
  });

  Compatibility copyWith({
    int? romanticCompatibilityRate,
    int? friendshipCompatibilityRate,
    Map<String, String>? romanticCompatibilityItems,
    Map<String, String>? friendshipCompatibilityItems,
  }) {
    return Compatibility(
      romanticCompatibilityRate:
          romanticCompatibilityRate ?? this.romanticCompatibilityRate,
      friendshipCompatibilityRate:
          friendshipCompatibilityRate ?? this.friendshipCompatibilityRate,
      romanticCompatibilityItems:
          romanticCompatibilityItems ?? this.romanticCompatibilityItems,
      friendshipCompatibilityItems:
          friendshipCompatibilityItems ?? this.friendshipCompatibilityItems,
    );
  }

  @override
  List<Object?> get props => [
        romanticCompatibilityRate,
        friendshipCompatibilityRate,
        romanticCompatibilityItems,
        friendshipCompatibilityItems,
      ];
}
