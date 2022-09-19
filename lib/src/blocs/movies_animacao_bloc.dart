import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/resources/repository.dart';
import 'package:project_movie/src/utils/genres.dart';
import 'package:rxdart/rxdart.dart';

class MoviesAnimacaoBloc extends BlocBase {
  final _repository = Repository();
  final _moviesFetcher = BehaviorSubject<ItemModel>();
  final _moviesId = BehaviorSubject<int>();

  Stream<ItemModel> get stream => _moviesFetcher.stream;
  Sink get sink => _moviesId.sink;

  MoviesAnimacaoBloc() {
    _moviesId.stream.listen((value) async {
      ItemModel itemModel =
          await _repository.fetchAllMovies(page: value, genre: Genres.animacao);
      _moviesFetcher.sink.add(itemModel);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _moviesFetcher.close();
  }
}
