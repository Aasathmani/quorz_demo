import 'package:app_qoruz/src/application/core/base_bloc_event.dart';

class HomeEvent extends BaseBlocEvent {}

class Initialize extends HomeEvent {
  int pageCount;
  Initialize(this.pageCount);
}

class PaginationList extends HomeEvent {
  int pageCount;
  PaginationList(this.pageCount);
}

class SuggestionListTapped extends HomeEvent {
  String suggestion;
  SuggestionListTapped(
    this.suggestion,
  );
}
