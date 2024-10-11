mixin class AppFunctionHelper<T> {
  bool validateEmail(String email) {
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

    final regex = RegExp(pattern);

    return regex.hasMatch(email);
  }

  bool isStrongPassword(String password) {
    // Define password criteria using regular expressions
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    RegExp digitRegex = RegExp(r'[0-9]');
    RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (password.length < 8) {
      return false;
    }

    if (!uppercaseRegex.hasMatch(password)) {
      return false;
    }

    if (!lowercaseRegex.hasMatch(password)) {
      return false;
    }

    if (!digitRegex.hasMatch(password)) {
      return false;
    }
    if (!specialCharRegex.hasMatch(password)) {
      return false;
    }

    return true; // Password meets all criteria
  }
}
