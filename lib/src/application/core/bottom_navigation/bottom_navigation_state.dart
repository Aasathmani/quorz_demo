import 'package:app_qoruz/src/application/core/base_bloc_state.dart';
import 'package:app_qoruz/src/presentation/core/base_screen_template.dart';

class BottomNavigationState extends BaseBlocState {
  BottomNavigationState({
    this.currentTab = BottomBarTab.markerPlace,
  });

  BottomBarTab? currentTab;

  @override
  BottomNavigationState copyWith({
    BottomBarTab? selectedTab,
  }) {
    return BottomNavigationState(
      currentTab: selectedTab ?? currentTab,
    );
  }
}
