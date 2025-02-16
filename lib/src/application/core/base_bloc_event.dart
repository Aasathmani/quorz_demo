
import 'package:app_qoruz/src/application/core/process_state.dart';

abstract class BaseBlocEvent {
  ProcessState processState = ProcessState.initial();
}
