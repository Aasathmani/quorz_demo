import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:app_qoruz/generated/l10n.dart';
import 'package:app_qoruz/src/core/app.dart';
import 'package:app_qoruz/src/domain/core/repository_provider.dart';
import 'package:app_qoruz/src/presentation/widgets/dialog/app_dialog.dart';
import 'package:app_qoruz/src/utils/extensions.dart';

class NetworkAuthInterceptor extends InterceptorsWrapper {
  static final _singleton = NetworkAuthInterceptor._internal();

  factory NetworkAuthInterceptor() => _singleton;

  NetworkAuthInterceptor._internal();

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await provideAuthRepository().processAuthError();
    } else if (err.response?.statusCode == 400) {
      debugPrint(err.response?.data.toString());
      if (err.response!.data is Map) {
        final data = toGenericMap(err.response!.data);

        openAppDialog(
          navigatorKey.currentState!.context,
          title: toGenericList(data['errors']).first.toString(),
          positiveButtonText: S.current.labelOk,
        );
      }
    }
    super.onError(err, handler);
  }
}
