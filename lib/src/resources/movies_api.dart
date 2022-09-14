import 'package:http/http.dart' as http;
import 'package:project_movie/src/models/item_model.dart';

class MoviesApi {
  final String _apiKey = 'a6d480541a151a410ba489d83fc81358';

  Future<ItemModel> fetchMovie() async {
    var url =
        Uri.parse('http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}