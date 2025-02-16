import 'package:hive/hive.dart';
import 'package:app_qoruz/src/domain/database/base_hive_dao.dart';
import 'package:app_qoruz/src/utils/extensions.dart';

class SettingsDao extends BaseHiveDao {
  static const kUserSecurity = 'user_security';

  Future<Box> getBox() async {
    return Hive.openBox("settings");
  }

  Future<void> setSecurityEnabled(bool value) async {
    final box = await getBox();
    box.put(kUserSecurity, value);
  }

  Future<bool> isSecurityEnabled() async {
    final box = await getBox();
    final value = await box.get(kUserSecurity);
    return toBool(value) ?? true;
  }

  @override
  Future<void> clear() async {
    final box = await getBox();
    await box.clear();
  }
}
