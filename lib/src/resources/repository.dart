import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/resources/movies_api.dart';

class Repository {
  final moviesApi = MoviesApi();

  Future<ItemModel> fetchAllMovies() => moviesApi.fetchMovie();
  Future<TrailerModel> fechallTrailer(id) => moviesApi.fetchTrailer(id);
}
