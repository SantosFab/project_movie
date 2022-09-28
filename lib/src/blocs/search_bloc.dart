import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/resources/repository.dart';

class SearchBloc extends BlocBase {
  final _moviesRepository = Repository();
  final _moviesFetcher = StreamController<ItemModel>.broadcast();
  final _moviesKey = StreamController<String>.broadcast();

  Stream<ItemModel> get stream => _moviesFetcher.stream;
  StreamSink get sink => _moviesKey.sink;

  SearchBloc() {
    fetchSearch();
  }

  Future<void> fetchSearch() async {
    _moviesKey.stream.listen((value) async {
      ItemModel trailerModel = await _moviesRepository.fetchSearch(value);
      _moviesFetcher.sink.add(trailerModel);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _moviesFetcher.close();
    _moviesKey.close();
  }
}
