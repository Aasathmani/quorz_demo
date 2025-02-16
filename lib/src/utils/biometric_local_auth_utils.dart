import 'dart:io';

import 'package:app_qoruz/generated/l10n.dart';
import 'package:app_settings/app_settings.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLocalAuthUtils {
  final LocalAuthentication localAuthentication;
  final DeviceInfoPlugin deviceInfoPlugin;

  BiometricLocalAuthUtils({
    required this.localAuthentication,
    required this.deviceInfoPlugin,
  });

  Future<bool> isDeviceSupported() async {
    return localAuthentication.isDeviceSupported();
  }

  Future<void> openDeviceSecuritySettings() async {
    await AppSettings.openAppSettings(type: AppSettingsType.security);
  }

  Future<bool> authenticate() async {
    if (Platform.isAndroid) {
      return authenticateUserInAndroid();
    }
    return authenticateUser();
  }

  Future<bool> authenticateUserInAndroid() async {
    final androidInfo = await deviceInfoPlugin.androidInfo;
    final int sdkVersion = androidInfo.version.sdkInt;
    if (sdkVersion >= 29) {
      return authenticateUser();
    } else if ((sdkVersion < 29) && (sdkVersion >= 23)) {
      return authenticateUser(biometricOnly: true);
    } else {
      return true;
    }
  }

  Future<bool> authenticateUser({bool biometricOnly = false}) async {
    return localAuthentication.authenticate(
      localizedReason: S.current.messagePleaseAuthenticateUsingBiometric,
      options: AuthenticationOptions(
        useErrorDialogs: false,
        stickyAuth: true,
        biometricOnly: biometricOnly,
      ),
    );
  }

  Future<bool> cancelAuthentication() async {
    return localAuthentication.stopAuthentication();
  }
}
