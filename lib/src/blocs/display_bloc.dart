import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class DisplayBloc extends BlocBase {
  final _displayFrom = BehaviorSubject<bool>();

  StreamSink<bool> get sink => _displayFrom.sink;
  ValueStream<bool> get stream => _displayFrom.stream;
  @override
  void dispose() {
    super.dispose();
    _displayFrom.close();
  }
}
