import 'package:app_qoruz/src/application/core/base_bloc_state.dart';
import 'package:app_qoruz/src/domain/database/core/app_database.dart';

class DetailsState extends BaseBlocState {
  RecentList? recentList;

  DetailsState({
    this.recentList,
  });

  @override
  DetailsState copyWith({
    RecentList? recentList,
  }) {
    return DetailsState(
      recentList: recentList ?? this.recentList,
    );
  }
}
