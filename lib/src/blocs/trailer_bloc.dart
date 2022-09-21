import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/resources/repository.dart';

class TrailerBloc extends BlocBase {
  final _trailerRepository = Repository();
  final _trailerFetcher = StreamController<TrailerModel>.broadcast();
  final _trailerId = StreamController<int>.broadcast();

  Stream<TrailerModel> get stream => _trailerFetcher.stream;
  StreamSink get sink => _trailerId.sink;

  TrailerBloc() {
    fetchTrailer();
  }

  Future<void> fetchTrailer() async {
    _trailerId.stream.listen((value) async {
      TrailerModel trailerModel =
          await _trailerRepository.fetchAllTrailer(value.toString());
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
