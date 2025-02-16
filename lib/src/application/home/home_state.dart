import 'package:app_qoruz/src/application/core/base_bloc_state.dart';
import 'package:app_qoruz/src/core/app_constants.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';

class HomeState extends BaseBlocState {
  String? suggestion;
  List<RecentList>? recentList;
  int pageCount;
  bool? isFetching;

  HomeState({
    this.suggestion = SuggestionList.forYou,
    this.recentList = const <RecentList>[],
    this.pageCount = 1,
    this.isFetching = false,
  });

  @override
  HomeState copyWith({
    String? suggestion,
    List<RecentList>? recentList,
    int? pageCount,
    bool? isFetching,
  }) {
    return HomeState(
      suggestion: suggestion ?? this.suggestion,
      recentList: recentList ?? this.recentList,
      pageCount: pageCount ?? this.pageCount,
      isFetching: isFetching ?? this.isFetching,
    );
  }
}
