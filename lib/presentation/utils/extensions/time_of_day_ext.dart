import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExt on TimeOfDay {
  String get horoskopeFormat {
    return DateFormat('HH:mm').format(
      DateTime(1, 1, 1, hour, minute),
    );
  }
}
