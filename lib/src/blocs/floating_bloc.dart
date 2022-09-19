import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class FloatingBloc extends BlocBase {
  final StreamController<bool> _foating = StreamController<bool>.broadcast();

  Stream<bool> get stream => _foating.stream;
  Sink<bool> get sink => _foating.sink;

  @override
  void dispose() {
    super.dispose();
    _foating.close();
  }
}
