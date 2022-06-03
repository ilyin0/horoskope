import 'package:intl/intl.dart';

const String _horoskopePattern = 'dd/MM/yyyy';

extension DateTimeExt on DateTime {
  String get horoskopeFormat {
    return DateFormat(_horoskopePattern).format(this);
  }
}
