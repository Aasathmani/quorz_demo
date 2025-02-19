import 'package:dio/dio.dart' as dio;
import 'package:intl/intl.dart' as intl;
import 'package:app_qoruz/config.dart';
import 'package:app_qoruz/src/utils/network_auth_interceptor.dart';
import 'package:app_qoruz/src/utils/network_usage_interceptor.dart';

const androidPlayStoreUrl =
    'https://play.google.com/store/apps/details?id=com.app.qoruz';
const iosAppStoreUrl =
    'https://itunes.apple.com/in/app/thinkpalm-hub/id6446245269';

const int maxFailuresCount = 3;

const whiteListDocumentExtensions = [
  '.pdf',
  '.doc',
  '.docx',
  '.jpg',
  '.jpeg',
  '.png',
  '.txt',
  '.xls',
  '.xlsx',
  '.mp3',
  '.mp4',
  '.mov',
];

const whiteListDocumentMimeTypes = [
  'application/msword',
  'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
  'image/jpeg',
  'image/png',
  'image/jpg',
  'application/pdf',
  'text/plain',
  'audio/',
];

const whiteListDocumentUtiTypes = [
  'public.image',
  'public.jpeg',
  'public.png',
  'com.adobe.pdf',
  'com.microsoft.word.doc',
  'com.microsoft.word.wordml',
];

const whiteListImageExtensions = ['.jpg', '.jpeg', '.png'];

const whiteListImageMimeTypes = [
  'image/jpeg',
  'image/png',
  'image/jpg',
];

const whiteListedAudioMimeTypes = ['audio/*'];

const whiteListAudioExtensions = [
  '.m4a',
  '.mp3',
  '.wav',
  '.wma',
  '.aac',
  'aud',
];

const whiteListVideoExtensions = [
  '.mp4',
];

const whiteListImageUtiTypes = [
  'public.image',
  'public.jpeg',
  'public.png',
];

const whiteListedAudioUtiTypes = [
  'public.audio',
  'public.mp3',
  'com.real.realaudio',
  'public.ulaw-audio',
  'public.au-audio',
  'public.aifc-audio',
  'public.midi-audio',
  'public.downloadable-sound',
  'com.apple.coreaudio-format',
  'public.ac3-audio',
  'com.digidesign.sd2-audio',
  'com.microsoft.thinkhubform-audio',
  'com.soundblaster.soundfont',
];

const whiteListDocumentExtensionsForChat = [
  '.pdf',
  '.xls',
  '.xlsx',
  'doc',
  'docx',
  'aac',
];

const whiteListVideoExtensionsForChat = [
  '.webm',
  '.mkv',
  '.flv',
  '.mp4',
  '.mpg',
];

const whiteListPdfMimeType = [
  'application/pdf',
];

const whiteListPdfUtiType = [
  'com.adobe.pdf',
];

//Fire base dynamic link
const kUriPrefix = 'https://thinkpalm.page.link';
const kWebUrl = 'https://thinkpalm.com';
const kBundleId = 'com.app.qoruz';

///Kb, Mb and Gb in Bytes
const kbInBytes = 1024;
const mbInBytes = 1048576;
const gbInBytes = 1073741824;

class Units {
  Units._();

  static const double _kPaddingUnit = 4.0;
  static const double kXSPadding = _kPaddingUnit;
  static const double kSPadding = 2 * _kPaddingUnit;
  static const double kMPadding = 3 * _kPaddingUnit;
  static const double kStandardPadding = 4 * _kPaddingUnit;
  static const double kLPadding = 5 * _kPaddingUnit;
  static const double kXLPadding = 6 * _kPaddingUnit;
  static const double kXXLPadding = 7 * _kPaddingUnit;
  static const double kXXXLPadding = 8 * _kPaddingUnit;

  static const double kTextFieldBorderRadius = 8;

  static const double kAppBarHeight = 70;
  static const double kAppIconSize = 24;
  static const double kAppIconSizeExtraSmall = 12;
  static const double kAppIconSizeLarge = 32;
  static const double kAppIconSizeMedium = 28;
  static const double kAppIconSizeSmall = 18;
  static const double kButtonBorderRadius = 8;
  static const double kButtonBorderWidth = 1;
  static const double kButtonElevation = 4;
  static const double kButtonHeight = 36;
  static const double kButtonHeightMedium = 40;
  static const double kButtonHeightLarge = 44;
  static const double kButtonHeightExtraSmall = 24;
  static const double kButtonHeightSmall = 32;
  static const double kButtonRadius = 30;
  static const double kButtonWidth = 140;
  static const double kCardBorderRadius = 12;
  static const double kCardBorderRadiusExtraSmall = 6;
  static const double kCardBorderRadiusLarge = 20;
  static const double kCardElevation = 4;
  static const double kContentOffSet = 50;
  static const double kExpandedHeight = 190;
  static const double kLineHeight = 1;
  static const double kLoaderHeight = 24;
  static const double kMinExpandedHeight = 100;
  static const double kMinExpandedWidth = 90;
  static const double kShadowBoxHeight = 60;
  static const double kShowDialogueBoxMaxHeight = 280;
  static const double kShowDialogueBoxMinHeight = 100;
  static const double kTextBoxHeight = 50;
  static const double kTextBoxRadius = 30;
  static const double kVeryMinExpandedHeight = 80;
  static const double kZero = 0;
}

class BottomBarTabName {
  static const String explore = 'Explore';
  static const String markerPlace = 'Markerplace';
  static const String search = 'Search';
  static const String activity = 'Activity';
  static const String profile = 'Profile';
}

class AppIcons {
  AppIcons._();

  static const String kBgImage = 'assets/images/bg.png';
  static const String kBgLandscape = 'assets/images/bg_landscape.jpg';
  static const String kDownArrow = 'assets/images/ic_down_arrow.svg';
  static const String kLogo = 'assets/images/heads_logo.png';
  static const String kAppLogo = 'assets/images/splash_logo.png';
  static const String kUser = 'assets/images/ic_user.svg';
  static const String kPassword = 'assets/images/ic_password.svg';
  static const String kReportees = 'assets/images/ic_reportees.svg';
  static const String kLeaveManagement =
      'assets/images/ic_leave_management.svg';
  static const String kHoliday = 'assets/images/ic_holiday.svg';
  static const String kForwardArrow = 'assets/images/ic_forward_arrow.svg';
  static const String kWorkFromHome = 'assets/images/ic_work_from_home.svg';
  static const String kCalenderBottomNavigation =
      'assets/images/ic_calendar.svg';
  static const String kTCubeBottomNavigation = 'assets/images/ic_time.svg';
  static const String kCreditCardBottomNavigation =
      'assets/images/ic_credit_cards.svg';
  static const String kInsuranceBottomNavigation =
      'assets/images/ic_insurance.svg';
  static const String kSearch = 'assets/images/ic_search.svg';
  static const String kEnabledCircle = 'assets/images/ic_circle_enabled.svg';
  static const String kDisabledCircle = 'assets/images/ic_circle_disabled.svg';
  static const String kLeave = 'assets/images/ic_leave.svg';
  static const String kTCube = 'assets/images/ic_tcube.svg';
  static const String kTax = 'assets/images/ic_tax.svg';
  static const String kSurvey = 'assets/images/ic_survey.svg';
  static const String kSwipe = 'assets/images/ic_swipe.svg';
  static const String kEmployee = 'assets/images/ic_employee.svg';
  static const String kFoodAndCab = 'assets/images/ic_food_cab.svg';
  static const String kInsurance = 'assets/images/ic_insurance.svg';
  static const String kTour = 'assets/images/ic_tour.svg';
  static const String kQMS = 'assets/images/ic_qms.svg';
  static const String kISMS = 'assets/images/ic_isms.svg';
  static const String kPolicies = 'assets/images/ic_policies.svg';
  static const String kAppraisal = 'assets/images/ic_appraisal.svg';
  static const String kKnowledgePortal = 'assets/images/ic_knowledge.svg';
  static const String kDirectory = 'assets/images/ic_directory.svg';
  static const String kContests = 'assets/images/ic_contest.svg';
  static const String kBlog = 'assets/images/ic_blog.svg';
  static const String kHamburger = 'assets/images/ic_hamburger.svg';
  static const String kSelect = 'assets/images/ic_tick_circle_selected.svg';
  static const String kUnSelect = 'assets/images/ic_tick_circle_unselected.svg';
  static const String kLogOut = 'assets/images/ic_logout.svg';
  static const String kProjectUnlock = 'assets/images/ic_project_unlock.svg';
  static const String kOtpImage = 'assets/images/im_otp.png';
  static const String kLoginBg = 'assets/images/bg_landscape.png';
  static const String kAppBarMenu = 'assets/images/app_menu.svg';
  static const String kSearchProfile = 'assets/images/search_profile.png';
  static const String kIcExplore = 'assets/images/ic_explore.svg';
  static const String kMarketPlace = 'assets/images/marketplace.svg';
  static const String kIcSearch = 'assets/images/ic_search.svg';
  static const String kIcActivity = 'assets/images/ic_activity.svg';
  static const String kIcProfile = 'assets/images/ic_profile.svg';
  static const String kIcStar = 'assets/images/ic_star.svg';
  static const String kAvatarProfile = 'assets/images/avatar_profile.png';
  static const String kIcClock = 'assets/images/ic_clock.svg';
  static const String kAgencyIcon = 'assets/images/agency_icon.svg';
  static const String kIcMap = 'assets/images/ic_map.svg';
  static const String kInstagram = 'assets/images/ic_instagram.svg';
  static const String kIcStarIcon = 'assets/images/ic_star_icon.svg';
  static const String kIcNotification = 'assets/images/ic_notification.svg';
  static const String kIcLinkedIn = 'assets/images/ic_linkedin.png';
  static const String kGradientDelete = 'assets/images/ic_gradient_delete.svg';
  static const String kGradientShare = 'assets/images/ic_gradient_share.svg';
  static const String kBuilding = 'assets/images/ic_building.svg';
  static const String kIcVerify = 'assets/images/ic_verify.svg';
  static const String kIcClockGradient = 'assets/images/ic_clock_gradient.svg';
  static const String kIcMic = 'assets/images/ic_mic.svg';
  static const String kIcWhatsapp = 'assets/images/ic_whatsapp.png';
  static const String kIcYoutube = 'assets/images/ic_youtube.svg';
  static const String kIcInsta = 'assets/images/ic_insta.png';
}

class APIEndpoints {
  // AUTH
  static String get _authBaseUrl =>
      Config.appFlavor.identityServerBaseUrl.replaceAll(
        '{tenant_id}',
        Config.appFlavor.tenantID,
      );

  static String get authUrl => '$_authBaseUrl/authorize';

  static String get authTokenUrl => '$_authBaseUrl/token';

  static String get logoutUrl => '$_authBaseUrl/logout';

  static String get logoutSessionUrl => '$_authBaseUrl/logoutsession';

  static String get loginUrl => '$_authBaseUrl/Account/Login';

  static String get changePasswordUrl => '$_authBaseUrl/Manage/ChangePassword';

  static String get userinfo => '$_authBaseUrl/userinfo';
}

class NetworkClient {
  NetworkClient._();

  static final dio.BaseOptions _options = dio.BaseOptions(
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
  );

  static dio.Dio? _dio;

  static dio.Dio get dioInstance {
    if (_dio == null) {
      _dio = dio.Dio(_options);
      _dio!.interceptors.add(NetworkUsageInterceptor());
      _dio!.interceptors.add(NetworkAuthInterceptor());
    }
    return _dio!;
  }
}

class DeepLinkType {
  static const String profile = 'profile';
}

class SuggestionList {
  static const String forYou = "For You";
  static const String recent = "Recent";
  static const String myRequests = "My Requests";
  static const String topRating = "Top Rating";
}

final dateFormat = intl.DateFormat("dd-MM-yyyy");
final timeFormat = intl.DateFormat("hh:mm aa");

const String docx = ".docx";
const String xls = ".xls";
