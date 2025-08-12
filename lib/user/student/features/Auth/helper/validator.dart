abstract class Validator {
  static bool _isEmail(String? email) {
    const pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$";
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email ?? "");
  }

  static String? Function(String? value) emailValidator() {
    return (String? email) {
      final trimmedEmail = email?.trim();
      if (trimmedEmail == null || trimmedEmail.isEmpty) {
        return "please Enter Your Email";
      } else if (!_isEmail(trimmedEmail)) {
        return "Please Enter an Email";
      }
      return null;
    };
  }

  static String? Function(String? value) signupPasswordValidator() {
    return (String? password) {
      final trimmedPassword = password?.trim();
      if (trimmedPassword == null || trimmedPassword.isEmpty) {
        return "please Enter Your Password";
      } else if (password!.length < 8) {
        return "Too Short";
      }
      return null;
    };
  }

  static String? Function(String? v) confirmPasswordValidator({
    required String? Function() orgPasswordGetter,
  }) {
    return (password) {
      final trimmedPassword = password?.trim();
      final trimmedOrgPassword = orgPasswordGetter()?.trim();
      if (trimmedPassword != trimmedOrgPassword) {
        return "Make sure from your password";
      }
      return null;
    };
  }

  static String? Function(String? v) signupNameValidator() {
    return (String? name) {
      final trimmedName = name?.trim();
      if (trimmedName == null || trimmedName.isEmpty) {
        return "please Enter Your Name";
      }
      if (name!.length < 8) {
        return "Too Short";
      }
      return null;
    };
  }

  static String? Function(String? v) loginPasswordValidator() {
    return (password) {
      final trimmedPassword = password?.trim();
      if (trimmedPassword == null || trimmedPassword.isEmpty) {
        return "please Enter Your Password";
      }
    };
  }
}