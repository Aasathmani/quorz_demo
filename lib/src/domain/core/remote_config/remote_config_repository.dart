

import 'package:app_qoruz/src/domain/core/config_repository.dart';
import 'package:app_qoruz/src/domain/core/remote_config/remote_config_service.dart';
import 'package:app_qoruz/src/domain/database/remote_config_dao.dart';
import 'package:app_qoruz/src/utils/guard.dart';

/// Created by Jemsheer K D on 25 September, 2023.
/// File Name : remote_config_repository
/// Project : CX Falcon

class RemoteConfigRepository {
  static RemoteConfigRepository? instance;

  final RemoteConfigService service;
  final RemoteConfigDao dao;

  RemoteConfigRepository({
    required this.service,
    required this.dao,
  });

  Future fetchAndUpdateRemoteConfigList() async {
    await Guard.runAsync(() async {
      final result = await service.fetchRemoteConfigList();
      if (result.isNotEmpty) {
        dao.saveRemoteConfig(result);
      }
    });

    final data = await dao.getRemoteConfig();
    updateDefaultConfig(data);
  }

  Future<Map<String, dynamic>> getRemoteConfig() {
    return dao.getRemoteConfig();
  }
}
