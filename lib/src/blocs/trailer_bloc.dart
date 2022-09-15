import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TrailerBloc extends BlocBase {
  final _trailerRepository = Repository();
  final _trailerFetcher = BehaviorSubject<TrailerModel>();
  final _trailerId = BehaviorSubject<int>();

  Stream<TrailerModel> get stream => _trailerFetcher.stream;
  StreamSink get sink => _trailerId.sink;

  TrailerBloc() {
    _trailerId.stream.listen((value) async {
      TrailerModel trailerModel =
          await _trailerRepository.fechallTrailer(value.toString());
      _trailerFetcher.sink.add(trailerModel);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _trailerFetcher.close();
    _trailerId.close();
  }
}
