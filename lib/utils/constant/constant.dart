import '../../model/utils/resource/app_constants.dart';

class Constant {
  Constant._();
  static String baseUrl = AppConstants.instance.baseUrl;

 // static const String baseUrl = 'http://13.232.39.141:8080/v1/';
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

  static const String dashBoard = 'dashboard/get-dashboard';
  static const String vendorsList = 'store/get-merchant';
  static const String getCreditProfile = 'credit_score/get-profile';
  static const String getProfile = 'users/get-user-personal-info';
  static const String updateProfileUrl = 'users/update-user-personal-info';

  static const String kycAddIdType = 'kyc/add-id-type';
  static const String kycUploadDoc = 'kyc/upload-document';
  static const String kycUploadSelfie = 'kyc/upload-selfie';
}
