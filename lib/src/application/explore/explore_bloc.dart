import 'package:app_qoruz/src/application/core/base_bloc.dart';
import 'package:app_qoruz/src/application/explore/explore_event.dart';
import 'package:app_qoruz/src/application/explore/explore_state.dart';

class ExploreBloc extends BaseBloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreState());
}
