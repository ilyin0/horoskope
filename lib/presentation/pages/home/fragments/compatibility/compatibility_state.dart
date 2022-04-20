import 'package:horoskope/domain/entities/compatibility.dart';

class CompatibilityState {
  final List<Compatibility>? compatibilityItems;

  CompatibilityState({
    this.compatibilityItems,
  });

  CompatibilityState copyWith({
    List<Compatibility>? compatibilityItems,
  }) {
    return CompatibilityState(
      compatibilityItems: compatibilityItems ?? this.compatibilityItems,
    );
  }
}
