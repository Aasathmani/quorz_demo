import 'dart:async';

import 'package:app_qoruz/config.dart';
import 'package:app_qoruz/src/core/app.dart';

Future<void> main() async {
  Config.appFlavor = Development();
  await initApp();
}
