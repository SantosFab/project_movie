import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class FloatingBloc extends BlocBase {
  final StreamController<int> _foating = StreamController<int>.broadcast();

  Stream<int> get stream => _foating.stream;
  Sink<int> get sink => _foating.sink;

  @override
  void dispose() {
    super.dispose();
    _foating.close();
  }
}
