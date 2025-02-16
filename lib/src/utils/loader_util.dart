import 'package:flutter/material.dart';
import 'package:app_qoruz/src/presentation/widgets/loader_widget.dart';

class LoaderUtil {
  static Future<void> showLoaderDialog(
    BuildContext context, {
    bool barrierDismissible = true,
  }) async {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return const LoaderWidget();
      },
    );
  }
}
