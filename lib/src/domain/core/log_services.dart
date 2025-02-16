import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';

class Logger {
  static Logger? _instance;
  final _fireBaseAnalytics = FirebaseAnalytics.instance;

  factory Logger() {
    return _instance ??= Logger._();
  }

  Logger._();

  void login(User user) {
    _fireBaseAnalytics.setUserId(id: user.id);
    _fireBaseAnalytics.logLogin();
  }

  void logout() {
    _fireBaseAnalytics.logEvent(name: LogEvents.logout);
    setUserID(null);
    _fireBaseAnalytics.setUserId(id: null);
  }

  void setCurrentScreen(String name) {
    _fireBaseAnalytics.setCurrentScreen(screenName: name);
  }

  Future log(
    String eventName,
    Map<String, dynamic>? eventParams, {
    bool isAnonymous = false,
  }) async {
    Map<String, dynamic>? params;
    if (!isAnonymous) {
      params = eventParams ?? <String, dynamic>{};
      /* final user = await userRepository.getActiveUser();
     if (user != null) {
        final details = await basicDetailRepository.getContent(user.id);
        params['cdc_number'] = user.cdcNumber ?? "";
        params['crew_code'] = details.crewCode ?? "";
        params['vessel_name'] = details.currentVesselName ?? "";
      }*/
    }
    _fireBaseAnalytics.logEvent(
      name: eventName,
      parameters: params,
    );
    debugPrint("$eventName : $params");
  }

  void setUserID(String? id) {
    _fireBaseAnalytics.setUserProperty(name: 'user_id', value: id);
  }
}

const Map<String, String> _screenNames = {
/*  SplashPage.route: 'splash',
  HomePage.route: 'home',*/
};

class LogEvents {
  static const String profileViewed = 'profile_viewed';
  static const String loggedIn = 'logged_in';
  static const String logInFailed = 'log_in_failed';
  static const String userFetchFromIDS = 'user_fetch_from_ids';
  static const String logInDBUpdate = 'log_in_db_update';
  static const String logInDBUpdateFailed = 'log_in_db_update_failed';
  static const String logout = 'logout';
  static const String deviceRegistration = 'device_registration';
  static const String deviceRegistrationFailed = 'device_registration_failed';
}

class LogParams {
  static const id = 'id';
  static const name = 'name';
  static const type = 'type';
}

String screenName(String name) {
  return _screenNames[name] ?? name;
}
