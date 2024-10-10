import 'constants.dart';

class PhoneNumberValidator {
  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    final regExp = RegExp(phoneNumberRegex);
    if (!regExp.hasMatch(value)) {
      return invalidPhoneNumberField;
    }

    if (value.length >= 11) {
      return null;
    }
    return invalidPhoneNumberField;
  }
}

class PasswordValidator {
  static String? validatePassword(String value) {
    final regExp = RegExp(passwordRegex);
    if (value.isEmpty) {
      return emptyPasswordField;
    } else if (value.length < 8) {
      return passwordLengthError;
    } else if (!regExp.hasMatch(value)) {
      return invalidPassword;
    } else {
      return null;
    }
  }
}

class ConfirmPasswordValidator {
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password again';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

class CompareValidator {
  static String? compare(String value, String compareValue) {
    if (value != compareValue) {
      return 'Password does not match';
    }
    return null;
  }
}

class EmailValidator {
  static String? validateEmail(String value) {
    final regExp = RegExp(emailRegex);
    if (value.isEmpty) {
      return emptyEmailField;
    } else if (!regExp.hasMatch(value)) {
      return invalidEmailField;
    } else {
      return null;
    }
  }
}

class OTPValidator {
  static String? validateOTP(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    if (value.length >= 6) {
      return null;
    }
    return invalidOTPField;
  }
}

class PinValidator {
  static String? validatePin(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}

class IntValidator {
  static String? validateIntField(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    if (value.length > 3) {
      return "Entry too long";
    }

    try {
      int.parse(value.trim());
      return null;
    } catch (e) {
      return "Value not an integer";
    }
  }
}

class FieldValidator {
  static String? validateField(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    if (value.length < 40) {
      return null;
    } else {
      return "Entry too long";
    }
  }

  static String? validateEmptyfield(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}

class DigitFieldValidator {
  static String? validateDigitField(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    if (value.length < 6) {
      return invalidOTPField;
    }
    return null;
  }
}
