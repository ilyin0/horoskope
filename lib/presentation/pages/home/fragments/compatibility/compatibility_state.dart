import 'package:horoskope/domain/entities/short_compatibility.dart';

class CompatibilityState {
  final List<ShortCompatibility>? compatibilityItems;

  CompatibilityState({
    this.compatibilityItems,
  });

  CompatibilityState copyWith({
    List<ShortCompatibility>? compatibilityItems,
  }) {
    return CompatibilityState(
      compatibilityItems: compatibilityItems ?? this.compatibilityItems,
    );
  }
}
