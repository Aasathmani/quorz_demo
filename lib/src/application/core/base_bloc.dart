import 'package:bloc/bloc.dart';
import 'package:app_qoruz/src/application/core/base_bloc_event.dart';
import 'package:app_qoruz/src/application/core/base_bloc_state.dart';
import 'package:app_qoruz/src/utils/string_utils.dart';

import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<Event extends BaseBlocEvent,
    State extends BaseBlocState> extends Bloc<Event, State> {
  final _message = PublishSubject<String>();
  final _dialogMessage = PublishSubject<String>();

  BaseBloc(super.initialState);

  Stream<String> get message => _message;

  Stream<String> get dialogMessage => _dialogMessage;

  void showMessage(String? message) {
    if (!_message.isClosed && StringUtils.isNotNullAndEmpty(message)) {
      _message.add(message!);
    }
  }

  void showMessageDialog(String? message) {
    if (!_dialogMessage.isClosed && StringUtils.isNotNullAndEmpty(message)) {
      _dialogMessage.add(message!);
    }
  }

  void dispose() {
    _message.close();
    _dialogMessage.close();
  }
}
