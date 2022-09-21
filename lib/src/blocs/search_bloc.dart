import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/resources/repository.dart';

class SearchBloc extends BlocBase {
  final _trailerRepository = Repository();
  final _trailerFetcher = StreamController<ItemModel>.broadcast();
  final _trailerId = StreamController<String>.broadcast();

  Stream<ItemModel> get stream => _trailerFetcher.stream;
  StreamSink get sink => _trailerId.sink;

  SearchBloc() {
    fetchSearch();
  }

  Future<void> fetchSearch() async {
    _trailerId.stream.listen((value) async {
      ItemModel trailerModel = await _trailerRepository.fetchSearch(value);
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
