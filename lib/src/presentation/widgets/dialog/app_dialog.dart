import 'package:flutter/material.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';

///Returns true if Positive Button clicked, false otherwise
Future<bool?> openAppDialog(
  BuildContext context, {
  String? title,
  String? content,
  Widget? child,
  String? positiveButtonText,
  String? negativeButtonText,
}) {
  assert(title != null || child != null);
  return showDialog<bool>(
    useRootNavigator: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return true;
        },
        child: AlertDialog(
          title: title != null
              ? Text(
                  title,
                  style: TextStyles.body1Bold(context),
                )
              : null,
          content: content != null || child != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (content != null)
                      Text(
                        content,
                        style: TextStyles.body1Regular(context),
                      ),
                    if (child != null) child,
                  ],
                )
              : null,
          actions: <Widget>[
            if (negativeButtonText != null)
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(negativeButtonText.toUpperCase()),
              ),
            if (positiveButtonText != null)
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(positiveButtonText.toUpperCase()),
              ),
          ],
        ),
      );
    },
  );
}
