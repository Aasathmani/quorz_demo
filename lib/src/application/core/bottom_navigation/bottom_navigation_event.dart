
import 'package:app_qoruz/src/application/core/base_bloc_event.dart';
import 'package:app_qoruz/src/presentation/core/base_screen_template.dart';

class BottomNavigationEvent extends BaseBlocEvent {}


class TabChanged extends BottomNavigationEvent {
  final BottomBarTab currentTab;

  TabChanged(this.currentTab);
}
