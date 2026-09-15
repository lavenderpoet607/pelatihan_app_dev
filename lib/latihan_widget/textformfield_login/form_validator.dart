import 'package:pelatihan_app_dev/latihan_widget/textformfield_login/latihan_form_login_enum.dart';

class FormValidator {
  static String? validateEmail(String? value) {
    final result = evaluateEmail(value);
    return result.errorMessage;
  }

  static FormValidationResult evaluateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return FormValidationResult.emptyEmail;
    } else if (!value.contains('@')) {
      return FormValidationResult.invalidEmailFormat;
    }
    return FormValidationResult.valid;
  }

  static String? validatePassword(String? value) {
    final result = evaluatePassword(value);
    return result.errorMessage;
  }

  static FormValidationResult evaluatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return FormValidationResult.emptyPassword;
    } else if (value.length < 6) {
      return FormValidationResult.passwordTooShort;
    }
    return FormValidationResult.valid;
  }
}
