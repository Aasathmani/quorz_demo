import 'package:app_qoruz/src/presentation/core/base_state.dart';
import 'package:app_qoruz/src/presentation/core/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app_qoruz/src/application/core/process_state.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/widgets/app_appbar.dart';
import 'package:app_qoruz/src/presentation/widgets/error_widget.dart';
import 'package:app_qoruz/src/presentation/widgets/loader_widget.dart';

/// Created by Jemsheer K D on 07 May, 2023.
/// File Name : app_page
/// Project : FESProject

class AppPage extends StatefulWidget {
  final String title;
  final Widget child;
  final bool isBackButtonRequired;
  final Function() retryOnTap;
  final Stream<ProcessState> processStateStream;
  final List<Widget> actions;
  final Color? backRoundColor;
  final Gradient? appbarGradient;
  final TextStyle? appBarTextStyle;
  final bool isBottomBarRequired;

  const AppPage({
    required this.title,
    required this.child,
    this.isBackButtonRequired = true,
    required this.retryOnTap,
    required this.processStateStream,
    this.actions = const [],
    this.backRoundColor,
    this.appbarGradient,
    this.appBarTextStyle,
    this.isBottomBarRequired = true,
  });

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends BaseState<AppPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgApp,
      appBar: _getAppBarLayout(context),
      body: StreamBuilder<ProcessState>(
        stream: widget.processStateStream,
        builder: (context, snapshot) {
          final processState = snapshot.data ?? ProcessState.initial();
          return SafeArea(
            top: false,
            child: _getBodyLayout(context, processState),
          );
        },
      ),
    );
  }

  AppAppbar _getAppBarLayout(BuildContext context) {
    return AppAppbar(
      title: widget.title,
      onUserTap: () {},
      isBackButtonRequired: widget.isBackButtonRequired,
      actions: widget.actions,
      backRoundColor: widget.backRoundColor,
      appbarGradient: widget.appbarGradient,
      appBarTextStyle: widget.appBarTextStyle,
    );
  }

  Widget _getBodyLayout(BuildContext context, ProcessState processState) {
    if (processState.status == ProcessStatus.busy) {
      return const LoaderWidget();
    } else if (processState.status == ProcessStatus.error) {
      return ErrorMessageWidget(
        title: processState.message,
        description: processState.errorMsg,
        retryOnTap: () => widget.retryOnTap(),
      );
    } else {
      return Column(
        children: [
          Expanded(child: widget.child),
          if (widget.isBottomBarRequired) ...[const BottomBar()],
        ],
      );
    }
  }
}
