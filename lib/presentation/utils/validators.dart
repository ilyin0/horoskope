abstract class Validators {
  static String? name(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter the name';
    }
    return null;
  }
}
