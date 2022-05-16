import 'package:equatable/equatable.dart';
import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:recase/recase.dart';

class CompatibilityDetailsState extends Equatable {
  final CompatibilityDetailsTab tab;
  final Compatibility? compatibility;

  const CompatibilityDetailsState({
    this.compatibility,
    this.tab = CompatibilityDetailsTab.romantic,
  });

  CompatibilityDetailsState copyWith({
    CompatibilityDetailsTab? tab,
    Compatibility? compatibility,
  }) {
    return CompatibilityDetailsState(
      tab: tab ?? this.tab,
      compatibility: compatibility ?? this.compatibility,
    );
  }

  @override
  List<Object?> get props => [tab, compatibility];
}

enum CompatibilityDetailsTab {
  romantic,
  friendship;

  @override
  String toString() {
    return name.sentenceCase;
  }
}
