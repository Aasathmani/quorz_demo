import 'package:app_qoruz/src/presentation/core/theme/gradients.dart';
import 'package:flutter/material.dart';
import 'package:app_qoruz/generated/l10n.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';

class AppAppbar extends PreferredSize {
  AppAppbar({
    super.key,
    required VoidCallback onUserTap,
    required bool isBackButtonRequired,
    String? screen,
    String? title,
    List<Widget> actions = const [],
    Color? backRoundColor,
    Gradient? appbarGradient,
    TextStyle? appBarTextStyle,
  }) : super(
    preferredSize: const Size.fromHeight(Units.kAppBarHeight),
    child: _AppAppbar(
      key: key,
      onUserTap: onUserTap,
      shouldShowBackIcon: isBackButtonRequired,
      screen: screen,
      title: title,
      actions: actions,
      backRoundColor: backRoundColor,
        appbarGradient:appbarGradient,
        appBarTextStyle: appBarTextStyle,
    ),
  );
}

class _AppAppbar extends StatelessWidget {
  final String? screen;
  final VoidCallback onUserTap;
  final String? title;
  final bool shouldShowBackIcon;
  final List<Widget> actions;
  final Color? backRoundColor;
  final Gradient? appbarGradient;
  final TextStyle? appBarTextStyle;

  const _AppAppbar({
    super.key,
    required this.onUserTap,
    required this.shouldShowBackIcon,
    this.screen,
    this.title,
    this.actions = const [],
    this.backRoundColor,
    this.appbarGradient,
    this.appBarTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// **Gradient Background**
        Container(
          height: Units.kAppBarHeight + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            gradient: appbarGradient,
          ),
        ),

        /// **AppBar with Transparent Background**
        Positioned.fill(
          child: AppBar(
            toolbarHeight: Units.kAppBarHeight,
            iconTheme: const IconThemeData(
              color: Colors.black, // Change your icon color here
            ),
            key: key,
            elevation: 0,
            automaticallyImplyLeading: shouldShowBackIcon,
            backgroundColor: Colors.transparent, // Set to transparent
            titleSpacing: 0,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: Units.kStandardPadding),
                child: Text(
                  title ?? S.current.labelFESProject,
                  style: appBarTextStyle,
                ),
              ),
            ),
            centerTitle: true,
            actions: actions.isNotEmpty ? actions : [],
          ),
        ),
      ],
    );
  }
}
