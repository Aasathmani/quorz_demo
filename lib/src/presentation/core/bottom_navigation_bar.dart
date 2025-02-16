import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_event.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_state.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/presentation/core/base_screen_template.dart';
import 'package:app_qoruz/src/presentation/core/theme/colors.dart';
import 'package:app_qoruz/src/presentation/core/theme/text_styles.dart';
import 'package:app_qoruz/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  BottomNavigationBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc ??= BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onPrimary,
      /*borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(Units.kButtonRadius),
        topRight: Radius.circular(Units.kButtonRadius),
      ),*/
      clipBehavior: Clip.antiAlias,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: Units.kSPadding),
          child: Row(
            children: [
              Expanded(
                child: bottomBarItem(
                  BottomBarTab.explore,
                  AppIcons.kIcExplore,
                  BottomBarTabName.explore,
                ),
              ),
              Expanded(
                child: bottomBarItem(
                  BottomBarTab.markerPlace,
                  AppIcons.kMarketPlace,
                  BottomBarTabName.markerPlace,
                ),
              ),
              Expanded(
                child: bottomBarItem(
                  BottomBarTab.search,
                  AppIcons.kIcSearch,
                  BottomBarTabName.search,
                ),
              ),
              Expanded(
                child: bottomBarItem(
                  BottomBarTab.activity,
                  AppIcons.kIcActivity,
                  BottomBarTabName.activity,
                ),
              ),
              Expanded(
                child: bottomBarItem(
                  BottomBarTab.profile,
                  AppIcons.kIcProfile,
                  BottomBarTabName.profile,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBarItem(BottomBarTab tab, String icon, String name) {
    return Material(
      color: AppColors.transparent,
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        bloc: _bloc,
        builder: (context, state) {
          return InkWell(
            onTap: () {
              _bloc!.add(TabChanged(tab));
              /*if (selectedTab == HomeTab.home) {
                _appBloc!.add(
                  AppThemeChanged(
                    _appBloc!.state.appTheme == AppThemeType.light
                        ? AppThemeType.dark
                        : AppThemeType.light,
                  ),
                );
              }*/
            },
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 50,
                          child: SvgPicture.asset(
                            icon,
                            height: 25,
                            color: state.currentTab == tab
                                ? AppColors.red
                                : AppColors.grey,
                            /* colorFilter:
                              Theme.of(context).colorScheme.primary.toColorFilter(),*/
                            // colorFilter: (state.currentTab == tab
                            //         ? AppColors.red
                            //         : AppColors.grey
                            //     .toColorFilter(),
                          ),
                        ),
                        if (tab == BottomBarTab.markerPlace)
                          Positioned(
                            top: -1, // Adjust position above icon
                            left: 25,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2), // Add padding
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "New",
                                style: TextStyles.captionRegular(context)!
                                    .copyWith(
                                  fontSize: 8,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: Units.kStandardPadding),
                  child: Text(
                    name.toPascalCase(),
                    style: state.currentTab == tab
                        ? TextStyles.body2Bold(context)
                            ?.copyWith(color: AppColors.black)
                        : TextStyles.labelRegular(context)
                            ?.copyWith(color: AppColors.corduroy),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
