import 'package:app_qoruz/src/application/core/base_bloc.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_event.dart';
import 'package:app_qoruz/src/application/core/bottom_navigation/bottom_navigation_state.dart';
import 'package:app_qoruz/src/domain/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc
    extends BaseBloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc()
      : super(BottomNavigationState()) {
    on<TabChanged>(
      (event, emit) => _onTabChanged(event, emit),
    );
  }

  void _onTabChanged(
    TabChanged event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(state.copyWith(selectedTab: event.currentTab));
  }
}
