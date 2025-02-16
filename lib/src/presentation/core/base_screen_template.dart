import 'package:app_qoruz/src/application/core/bloc_provider.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_state.dart';
import 'package:app_qoruz/src/application/explore/explore_bloc.dart';
import 'package:app_qoruz/src/application/home/home_bloc.dart';
import 'package:app_qoruz/src/presentation/core/base_state.dart';
import 'package:app_qoruz/src/presentation/explore/explore_page.dart';
import 'package:app_qoruz/src/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomBarTab {
  explore,
  markerPlace,
  search,
  activity,
  profile,
}

class BaseScreenTemplate extends StatefulWidget {
  static String route = '/baseScreenTemplate';

  @override
  State<StatefulWidget> createState() => _BaseScreenTemplateState();
}

class _BaseScreenTemplateState extends BaseState<BaseScreenTemplate> {
  BottomNavigationBloc? _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc ??= BlocProvider.of(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.currentTab != null) {
          // switch (state.currentTab ?? BottomBarTab.generalForm) {
          switch (state.currentTab ?? BottomBarTab.markerPlace) {
            case BottomBarTab.explore:
              return BlocProvider(
                create: (_) => ExploreBloc(),
                child: const ExplorePage(),
              );

            case BottomBarTab.markerPlace:
              return BlocProvider(
                create: (_) => provideHomeBloc(),
                child: const HomePage(),
              );

            case BottomBarTab.search:
              return BlocProvider(
                create: (_) => ExploreBloc(),
                child: const ExplorePage(),
              );
            case BottomBarTab.activity:
              return BlocProvider(
                create: (_) => ExploreBloc(),
                child: const ExplorePage(),
              );
            case BottomBarTab.profile:
              return BlocProvider(
                create: (_) => ExploreBloc(),
                child: const ExplorePage(),
              );
          }
        }
        return BlocProvider(
          create: (_) => provideHomeBloc(),
          child: const HomePage(),
        );
      },
    );
  }
}
