import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/resources/movies_api.dart';

class Repository {
  final moviesApi = MoviesApi();

  Future<ItemModel> fetchAllMovies({int? page, String? genre}) =>
      moviesApi.fetchMovie(page: page, genre: genre);

  Future<TrailerModel> fetchAllTrailer(String id) => moviesApi.fetchTrailer(id);

  Future<ItemModel> fetchSearch(String pesquisa) =>
      moviesApi.fetchSearch(pesquisa: pesquisa);
}
