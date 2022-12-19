class Constant {
  Constant._();

  static const String baseUrl = 'http://13.232.39.141:8080/v1/';
  static const String signUp = 'auth/register';
  static const String login = 'auth/login';
  static const String verifyOtp = 'auth/verify-otp';
  static const String forgetPassword = 'auth/forgot-password';
  static const String verifyForgetOtp = 'auth/verify-forgot-otp';
  static const String resetPassword = 'auth/reset-password';

  static const String creditAddProfile = 'credit_score/add-profile';
  static const String creditUploadStatement = 'credit_score/upload-statement';
  static const String addQuiz = 'quiz/add-quiz';
  static const String getCreditScore = 'credit_score/get-credit-score';
}
