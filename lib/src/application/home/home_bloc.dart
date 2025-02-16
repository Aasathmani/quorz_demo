import 'package:app_qoruz/src/application/core/base_bloc.dart';
import 'package:app_qoruz/src/application/core/process_state.dart';
import 'package:app_qoruz/src/application/home/home_event.dart';
import 'package:app_qoruz/src/application/home/home_state.dart';
import 'package:app_qoruz/src/domain/home/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({
    required this.homeRepository,
  }) : super(HomeState()) {
    on<Initialize>((event, emit) async {
      await _getRecentList(event: event, emit: emit);
    });
    on<SuggestionListTapped>((event, emit) {
      emit(state.copyWith(suggestion: event.suggestion));
    });
    on<PaginationList>((event, emit) async {
      if (state.isFetching!) return;
      emit(state.copyWith(isFetching: true, pageCount: event.pageCount));
      final result = await homeRepository.getRecentList(event.pageCount);

      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            recentList: [...?state.recentList, ...result],
            isFetching: false,
          ),
        );
      }
    });
    add(Initialize(state.pageCount));
  }

  Future<void> _getRecentList({
    required Initialize event,
    required Emitter<HomeState> emit,
  }) async {
    emit(
      state.copyWith()..processState = ProcessState.busy(),
    );
    try {
      final result = await homeRepository.getRecentList(event.pageCount);
      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            recentList: result,
          )..processState = ProcessState.completed(),
        );
      } else {
        emit(
          state.copyWith()..processState = ProcessState.completed(),
        );
      }
    } catch (e) {
      showMessage(e.toString());
      emit(state.copyWith()..processState = ProcessState.completed());
    }
  }
}
