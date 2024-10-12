class AppString {
  AppString._();

  static const String appName = "kurups_app";
  static const String dontHaveAcc = "Don't have an account?";
  static const String alreadyRegistered = "Already have an account?";
  static const String login = "Login";
  static const String register = "Register";
  static const String home = "Home";
  static const String registerSuccess = "Registered successfully!!";
  static const String welcomeText = "Welcome to Kurups Maths";
  static const String startLearning = "Start learning";
  static const String categoires = "Categories";
  static const String courseInProgress = "Courses in progress";
}

int firstNameLength = 50;
int lastNamelength = 29;

class AppErrors {
  AppErrors._();

  static const String passwordError = 'Password must be at least 8 characters';
  static const String passwordEmpty = 'Password required';
  static const String emailError = 'Please enter a valid email';
}

class AppAlertMessage {
  static const String emailError = 'Please enter a valid email';
}
