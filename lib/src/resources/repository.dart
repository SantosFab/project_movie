import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/resources/movies_api.dart';

class Repository {
  final moviesApi = MoviesApi();
  Future<ItemModel> fetchAllMovies() => moviesApi.fetchMovie();
}
