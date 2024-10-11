class FirebaseAuthErrorCodes {
  static const String invalidApiKey = 'invalid-api-key';
  static const String appNotAuthorized = 'app-not-authorized';
  static const String networkRequestFailed = 'network-request-failed';

  // Email/Password Authentication Errors
  static const String emailAlreadyInUse = 'email-already-in-use';
  static const String invalidEmail = 'invalid-email';
  static const String operationNotAllowed = 'operation-not-allowed';
  static const String weakPassword = 'weak-password';
  static const String userDisabled = 'user-disabled';
  static const String userNotFound = 'user-not-found';
  static const String wrongPassword = 'wrong-password';

  // Phone Number Authentication Errors
  static const String invalidVerificationCode = 'invalid-verification-code';
  static const String invalidVerificationId = 'invalid-verification-id';
  static const String invalidCredential = 'invalid-credential';
  // Google Sign-In Errors
  static const String popupClosedByUser = 'popup-closed-by-user';
  static const String accountExistsWithDifferentCredential =
      'account-exists-with-different-credential';

  // Token Errors
  static const String expiredActionCode = 'expired-action-code';
  static const String invalidActionCode = 'invalid-action-code';

  // Helper function to map error codes to human-readable messages
  static String getErrorMessage(String errorCode) {
    switch (errorCode) {
      case invalidApiKey:
        return 'The API key provided is invalid.';
      case appNotAuthorized:
        return 'The app is not authorized to use Firebase Authentication.';
      case networkRequestFailed:
        return 'Network error occurred. Please check your connection.';
      case emailAlreadyInUse:
        return 'This email address is already associated with another account.';
      case invalidEmail:
        return 'The email address is invalid.';
      case operationNotAllowed:
        return 'Email/password accounts are not enabled.';
      case weakPassword:
        return 'The password is too weak.';
      case userDisabled:
        return 'The user account has been disabled.';
      case userNotFound:
        return 'No user found for the provided email.';
      case wrongPassword:
        return 'The password is incorrect.';
      case invalidVerificationCode:
        return 'The verification code is invalid.';
      case invalidVerificationId:
        return 'The verification ID is invalid.';
      case popupClosedByUser:
        return 'The popup was closed before completing the sign-in process.';
      case accountExistsWithDifferentCredential:
        return 'This account already exists with a different sign-in credential.';
      case expiredActionCode:
        return 'The action code has expired.';
      case invalidActionCode:
        return 'The action code is invalid.';
      case invalidCredential:
        return 'The given details are invalid';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
