import 'package:flutter/material.dart';
import 'package:horoskope/l10n/horoskope_localizations.dart';

extension BuildContextExt on BuildContext {
  HoroskopeLocalizations get localizations {
    return HoroskopeLocalizations.of(this)!;
  }
}
