import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:app_qoruz/src/application/details/details_bloc.dart';
import 'package:app_qoruz/src/application/home/home_bloc.dart';
import 'package:app_qoruz/src/presentation/home/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_qoruz/src/application/profile/profile_bloc.dart';
import 'package:app_qoruz/src/application/splash/splash_bloc.dart';
import 'package:app_qoruz/src/application/web_view/web_view_bloc.dart';
import 'package:app_qoruz/src/domain/core/repository_provider.dart';
import 'package:app_qoruz/src/presentation/web_view/web_view_page.dart';
import 'package:app_qoruz/src/utils/device_token_helper.dart';
import 'package:app_qoruz/src/utils/file_util.dart';
import 'package:app_qoruz/src/utils/notification_util.dart';

SplashBloc provideSplashBloc() {
  return SplashBloc(
    authRepository: provideAuthRepository(),
    userRepository: provideUserRepository(),
  );
}

HomeBloc provideHomeBloc() {
  return HomeBloc(
    homeRepository: provideHomeRepository(),
  );
}

BottomNavigationBloc provideBottomNavigationBloc() {
  return BottomNavigationBloc();
}

ProfileBloc provideProfileBloc() {
  return ProfileBloc();
}

// LoginBloc provideLoginBloc() {
//   return LoginBloc(
//       authRepository: provideAuthRepository(),
//       userRepository: provideUserRepository());
// }

WebViewBloc provideWebViewBloc(WebViewArgument argument) {
  return WebViewBloc(
    authRepository: provideAuthRepository(),
    isHeaderRequired: argument.isHeaderRequired,
    url: argument.url,
    title: argument.title,
    successUrl: argument.successUrl,
    alternateSuccessUrl: argument.alternateSuccessUrl,
    failureUrl: argument.failureUrl,
    isBackConfirmationRequired: argument.isBackConfirmationRequired,
    fileUtil: provideFileUtil(),
  );
}

DetailsBloc provideDetailsBloc(DetailsPageArgument argument) {
  return DetailsBloc(
    recentList: argument.recentList!,
  );
}

// OtpBloc provideOtpBloc(LoginPageArguments argument) {
//   return OtpBloc(
//     authRepository: provideAuthRepository(),
//     networkValidator: provideNetworkValidator(),
//     email: argument.email,
//     mobileNumber: argument.mobileNumber,
//   );
// }

DeviceTokenHelper provideDeviceTokenHelper() {
  return DeviceTokenHelper(
    deviceTokenRepository: provideDeviceTokenRepository(),
    userRepository: provideUserRepository(),
  );
}

NotificationUtil provideNotificationUtil() {
  return NotificationUtil(
    networkValidator: provideNetworkValidator(),
  );
}

FileUtil provideFileUtil() {
  return FileUtil(
    imagePicker: ImagePicker(),
  );
}
