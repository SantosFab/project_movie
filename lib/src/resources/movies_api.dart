import 'package:http/http.dart' as http;
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/models/trailer_model.dart';

class MoviesApi {
  final String _apiKey = 'a6d480541a151a410ba489d83fc81358';

  Future<ItemModel> fetchMovie({String? genre, int? page}) async {
    late Uri url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre&with_watch_monetization_types=flatrate');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(response.body);
    } else {
      throw Exception('Falhar em encontrar os filmes');
    }
  }

  Future<ItemModel> fetchSearch({required String pesquisa}) async {
    late Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&language=pt-BR&query=$pesquisa');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(response.body);
    } else {
      throw Exception('Falha em encontrar o filme');
    }
  }

  Future<TrailerModel> fetchTrailer(String id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$_apiKey&language=pt-BR');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return TrailerModel.fromJson(response.body);
    } else {
      throw Exception('Falhar em encontrar os trailers');
    }
  }
}
