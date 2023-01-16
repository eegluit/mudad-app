
class ImageResource {
  static ImageResource? _instance;
  static ImageResource get instance => _instance ??= ImageResource._init();
  ImageResource._init();

  String toIcons(String name) => 'assets/images/icons/$name';
  String toViewImage(String name) => 'assets/images/view_images/$name';
  String toAppLogo(String name) => 'assets/images/app_logo/$name';
  String toPlaceholderAndError(String name) => 'assets/images/placeholder_and_error/$name';
  String toLottieImage(String name) => 'assets/lottie/$name';

  /// place holder
  String get placeholderImage => toPlaceholderAndError('placeholderImage.gif');
  String get errorImage => toPlaceholderAndError('error.png');
  /// app logo
  String get appLogo => toAppLogo('appLogo.png');
  /// root view
  String get homeIcon  => toIcons('home.png');
  String get myOffersIcon  => toIcons('myOffers.png');
  String get transactionIcon  => toIcons('transaction.svg');
  String get accountIcon  => toIcons('account.png');
  String get checkIcon  => toIcons('checkIcon.png');
  /// last transaction
  String get transactionOne   => toIcons('one.png');
  String get transactionTwo   => toIcons('two.png');
  String get transactionThree   => toIcons('three.png');
  String get transactionFour   => toIcons('four.png');
  /// home
  String get mainViewBackground  => toViewImage('main_view_background.png');
  String get walletIcon  => toIcons('wallet.png');
  String get notificationIcon  => toIcons('notification.png');

  /// payment
  String get applePayIcon  => toIcons('applePay.png');
  String get visaPayIcon  => toIcons('visa.png');
  String get payIcon  => toIcons('paypal.png');
  String get masterCard  => toIcons('masterCard.png');
  String get visaCard  => toIcons('visaCard.png');
  String get payPalCard  => toIcons('payPalCard.png');
  /// refer
  String get referImage  => toIcons('refer.png');
  /// vendor
  String get luluIcon  => toIcons('Lululemon_logo 1.png');
  String get nandoIcon  => toIcons('Nandos-Logo 1.png');
  String get starBuckIcon  => toIcons('starbucks-logo-png-transparent 1.png');
  String get diorIcon  => toIcons('58429610a6515b1e0ad75ad3 1.png');
  String get macIcon  => toIcons('mac-cosmetics-vector-logo-png-3 1.png');
  String get hnmIcon  => toIcons('hm-logo-1 1.png');

  /// no data found
  String get noDataFoundImage  => toViewImage('no_data_found.png');
  String get deleteIcon  => toIcons('delete_icon.png');

  /// profile
  String get passwordIcon  => toIcons('password.png');
  String get storeIcon  => toIcons('store.png');
  String get kycIcon  => toIcons('kyc.png');
  String get logoutIcon  => toIcons('logout.png');

  ///  default images
  String get defaultUser  => "https://icon-library.com/images/default-user-icon/default-user-icon-3.jpg";
  String get defaultCompanyLogo  => "https://seeklogo.com/images/C/corporate-company-logo-749CEE6ADC-seeklogo.com.png";
  String get defaultBannerShimmer => "https://thumbs.gfycat.com/ImpressionableAnimatedAndeancat-size_restricted.gif";
  String get defaultCloth  => "https://i.pinimg.com/originals/bd/ef/cb/bdefcbc72735f64db17f3250b1e64245.png";
  String get offer1Icon  => "https://www.pngall.com/wp-content/uploads/2016/04/50-off-PNG-File.png";
  String get offer2Icon  => "https://cdn-icons-png.flaticon.com/512/2331/2331980.png";


  /// verification screen
  String get checkCircleIcon => toIcons('checkCircle.png');
  String get rejectCircleIcon => toIcons('rejectCircle.png');
  String get ovalImage => toViewImage('ovalImage.png');

  /// store registration
  String get vectorIcon => toIcons('Vector.png');

  /// lottie
  String get successfulPaymentIcon  =>toLottieImage("Successful.json");








}