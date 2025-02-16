import 'package:app_qoruz/src/application/core/base_bloc.dart';
import 'package:app_qoruz/src/application/core/process_state.dart';
import 'package:app_qoruz/src/application/details/details_event.dart';
import 'package:app_qoruz/src/application/details/details_state.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';

class DetailsBloc extends BaseBloc<DetailsEvent, DetailsState> {
  RecentList recentList;
  DetailsBloc({
    required this.recentList,
  }) : super(DetailsState()) {
    on<Initialize>((event, emit) {
      emit(state.copyWith()..processState=ProcessState.busy());
      emit(state.copyWith(recentList: recentList)..processState=ProcessState.completed());
    });
    add(Initialize());
  }
}
