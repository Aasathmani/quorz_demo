import 'package:dio/dio.dart';
import 'package:app_qoruz/config.dart';
import 'package:app_qoruz/src/domain/auth/auth_repository.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';
import 'package:app_qoruz/src/utils/string_utils.dart';

Future<Options> getDioOptions({required AuthRepository authRepository}) async {
  final authToken = await authRepository.getActiveToken();
  return Options(
    headers: getHeaders(authToken: authToken),
  );
}

Map<String, dynamic> getHeaders({AuthToken? authToken, String? userToken}) {
  return {
    if (authToken != null) 'Authorization': 'Bearer ${authToken.accessToken}',
    if (StringUtils.isNotNullAndEmpty(userToken))
      'Authorization': 'Bearer $userToken',
    'app': 'Map Assignment',
    'version': Config.getVersionName(),
    'build': Config.getBuildNumber(),
    'source': Config.appSource,
    'Content-Type': 'application/json',
  };
}

class AppSource {
  AppSource._();

  static const String web = 'WEB';
  static const String windows = 'WINDOWS';
  static const String macOS = 'MACOS';
  static const String linux = 'LINUX';
  static const String android = 'MOBILE_ANDROID';
  static const String iOS = 'MOBILE_IOS';
}
