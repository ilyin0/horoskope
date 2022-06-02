abstract class Validators {
  static String? name(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter the name';
    }
    return null;
  }

  static String? email(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter email';
    }
    if (value is! String) {
      return 'Something\'s gone wrong. Please, try again';
    }
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$',
    );
    if (emailRegex.hasMatch(value)) {
      return null;
    }
    return 'Please input correct email';
  }

  static String? password(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please, enter password';
    }
    final passwordRegex = RegExp(
      r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$',
    );
    if (passwordRegex.hasMatch(value)) {
      return null;
    }
    return 'Password must contain at least 8 characters including number, capital and special symbol';
  }

  static String? confirmPassword(dynamic value, String reference) {
    if (value == null || value.isEmpty) {
      return 'Please, enter password';
    }
    if (value == reference) return null;
    return 'Please check out password';
  }
}
