import 'dart:convert';
// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, non_constant_identifier_names, library_private_types_in_public_api

class ItemModel {
  final int _pages;
  final List<_Results> _results;
  final int _total_pages;
  final int _total_results;

  ItemModel(
    this._pages,
    this._results,
    this._total_pages,
    this._total_results,
  );

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      map['page'] as int,
      List<_Results>.from(
        (map['results'] as List<dynamic>).map<_Results>(
          (x) => _Results.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['total_pages'] as int,
      map['total_results'] as int,
    );
  }

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  int get page => _pages;
  List<_Results> get results => _results;
  int get totalPage => _total_pages;
  int get totalResults => _total_results;

  @override
  String toString() {
    return 'ItemModel(_pages: $_pages, _results: $_results, _total_pages: $_total_pages, _total_results: $_total_results)';
  }
}

class _Results {
  final bool _adult;
  final String _backdrop_path;
  final List<int> _genre_ids;
  final int _id;
  final String _original_language;
  final String _original_title;
  final String _overview;
  final double _popularity;
  final String _poster_path;
  final String _release_date;
  final String _title;
  final bool _video;
  final double _vote_average;
  final int _vote_count;

  _Results(
      this._adult,
      this._backdrop_path,
      this._genre_ids,
      this._id,
      this._original_language,
      this._original_title,
      this._overview,
      this._popularity,
      this._poster_path,
      this._release_date,
      this._title,
      this._video,
      this._vote_average,
      this._vote_count);

  factory _Results.fromMap(Map<String, dynamic> map) {
    return _Results(
      map['adult'] as bool,
      map['backdrop_path'] as String,
      List<int>.from(
        (map['genre_ids'] as List<dynamic>),
      ),
      map['id'] as int,
      map['original_language'] as String,
      map['original_title'] as String,
      map['overview'] as String,
      map['popularity'] as double,
      map['poster_path'] as String,
      map['release_date'] as String,
      map['title'] as String,
      map['video'] as bool,
      map['vote_average'].toDouble() as double,
      map['vote_count'] as int,
    );
  }

  bool get adult => _adult;
  String get backdropPath => _backdrop_path;
  List<int> get genres => _genre_ids;
  int get id => _id;
  String get originalLanguage => _original_language;
  String get originalTitle => _original_title;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _poster_path;
  String get releaseDate => _release_date;
  String get title => _title;
  bool get video => _video;
  double get voteAverega => _vote_average;
  int get voteCount => _vote_count;

  @override
  String toString() {
    return '_Results(_adult: $_adult, _backdrop_path: $_backdrop_path, _genre_ids: $_genre_ids, _id: $_id, _original_language: $_original_language, _original_title: $_original_title, _overview: $_overview, _popularity: $_popularity, _poster_path: $_poster_path, _release_date: $_release_date, _title: $_title, _video: $_video, _vote_average: $_vote_average, _vote_count: $_vote_count)';
  }
}
