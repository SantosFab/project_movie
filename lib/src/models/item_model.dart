// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, non_constant_identifier_names, library_private_types_in_public_api

class ItemModel {
  final bool _adult;
  final String _backdrop_path;
  final bool _belongs_to_collection;
  final int _budget;
  final List<_Genres> _genres;
  final String _homepage;
  final int _id;
  final String _imdb_id;
  final String _original_language;
  final String _original_title;
  final String _overview;
  final double _popularity;
  final String _poster_path;
  final List<_ProductionCompanies> _production_companies;
  final List<_ProductionCountries> _production_countries;
  final String _release_date;
  final int _revenue;
  final int _runtime;
  final List<_SpokenLanguages> _spoken_languages;
  final String _status;
  final String _tagline;
  final String _title;
  final bool _video;
  final double _vote_averague;
  final int _vote_count;

  ItemModel(
    this._adult,
    this._backdrop_path,
    this._belongs_to_collection,
    this._budget,
    this._genres,
    this._homepage,
    this._id,
    this._imdb_id,
    this._original_language,
    this._original_title,
    this._overview,
    this._popularity,
    this._poster_path,
    this._production_companies,
    this._production_countries,
    this._release_date,
    this._revenue,
    this._runtime,
    this._spoken_languages,
    this._status,
    this._tagline,
    this._title,
    this._video,
    this._vote_averague,
    this._vote_count,
  );

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      map['_adult'] as bool,
      map['_backdrop_path'] as String,
      map['_belongs_to_collection'] as bool,
      map['_budget'] as int,
      List<_Genres>.from(
        (map['_genres'] as List<int>).map<_Genres>(
          (x) => _Genres.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['_homepage'] as String,
      map['_id'] as int,
      map['_imdb_id'] as String,
      map['_original_language'] as String,
      map['_original_title'] as String,
      map['_overview'] as String,
      map['_popularity'] as double,
      map['_poster_path'] as String,
      List<_ProductionCompanies>.from(
        (map['_production_companies'] as List<int>).map<_ProductionCompanies>(
          (x) => _ProductionCompanies.fromMap(x as Map<String, dynamic>),
        ),
      ),
      List<_ProductionCountries>.from(
        (map['_production_countries'] as List<int>).map<_ProductionCountries>(
          (x) => _ProductionCountries.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['_release_date'] as String,
      map['_revenue'] as int,
      map['_runtime'] as int,
      List<_SpokenLanguages>.from(
        (map['_spoken_languages'] as List<int>).map<_SpokenLanguages>(
          (x) => _SpokenLanguages.fromMap(x as Map<String, dynamic>),
        ),
      ),
      map['_status'] as String,
      map['_tagline'] as String,
      map['_title'] as String,
      map['_video'] as bool,
      map['_vote_averague'] as double,
      map['_vote_count'] as int,
    );
  }

  bool get adult => _adult;
  String get backdropPath => _backdrop_path;
  bool get belongsToCollection => _belongs_to_collection;
  int get budget => _budget;
  List<_Genres> get genres => _genres;
  String get homepage => _homepage;
  int get id => _id;
  String get imdbId => _imdb_id;
  String get originalLanguage => _original_language;
  String get originalTitle => _original_title;
  String get overview => _overview;
  double get popularity => _popularity;
  String get posterPath => _poster_path;
  List<_ProductionCompanies> get productionCompanies => _production_companies;
  List<_ProductionCountries> get productionCountries => _production_countries;
  String get releaseDate => _release_date;
  int get revenue => _revenue;
  int get runtime => _runtime;
  List<_SpokenLanguages> get spokenLanguages => _spoken_languages;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  double get voteAverega => _vote_averague;
  int get voteCount => _vote_count;

  @override
  String toString() {
    return 'ItemModel(_adult: $_adult, _backdrop_path: $_backdrop_path, _belongs_to_collection: $_belongs_to_collection, _budget: $_budget, _genres: $_genres, _homepage: $_homepage, _id: $_id, _imdb_id: $_imdb_id, _original_language: $_original_language, _original_title: $_original_title, _overview: $_overview, _popularity: $_popularity, _poster_path: $_poster_path, _production_companies: $_production_companies, _production_countries: $_production_countries, _release_date: $_release_date, _revenue: $_revenue, _runtime: $_runtime, _spoken_languages: $_spoken_languages, _status: $_status, _tagline: $_tagline, _title: $_title, _video: $_video, _vote_averague: $_vote_averague, _vote_count: $_vote_count)';
  }
}

class _Genres {
  final int _id;
  final String _name;

  _Genres(
    this._id,
    this._name,
  );

  factory _Genres.fromMap(Map<String, dynamic> map) {
    return _Genres(
      map['_id'] as int,
      map['_name'] as String,
    );
  }

  int get id => _id;
  String get name => _name;

  @override
  String toString() => '_Genres(_id: $_id, _name: $_name)';
}

class _ProductionCompanies {
  final int _id;
  final String _logo_path;
  final String _name;
  final String _origin_country;

  _ProductionCompanies(
    this._id,
    this._logo_path,
    this._name,
    this._origin_country,
  );

  factory _ProductionCompanies.fromMap(Map<String, dynamic> map) {
    return _ProductionCompanies(
      map['id'] as int,
      map['logo_path'] as String,
      map['name'] as String,
      map['origin_country'] as String,
    );
  }

  int get id => _id;
  String get logoPath => _logo_path;
  String get name => _name;
  String get originCountry => _origin_country;

  @override
  String toString() {
    return '_Production_companies(id: $_id, logo_path: $_logo_path, name: $_name, origin_country: $_origin_country)';
  }
}

class _ProductionCountries {
  final String _iso_3166_1;
  final String _name;

  _ProductionCountries(
    this._iso_3166_1,
    this._name,
  );

  factory _ProductionCountries.fromMap(Map<String, dynamic> map) {
    return _ProductionCountries(
      map['_iso_3166_1'] as String,
      map['_name'] as String,
    );
  }

  String get iso31661 => _iso_3166_1;
  String get name => _name;

  @override
  String toString() =>
      '_ProductionCountries(_iso_3166_1: $_iso_3166_1, _name: $_name)';
}

class _SpokenLanguages {
  final String _english_name;
  final String _iso_639_1;
  final String _name;

  _SpokenLanguages(this._english_name, this._iso_639_1, this._name);

  factory _SpokenLanguages.fromMap(Map<String, dynamic> map) {
    return _SpokenLanguages(
      map['_english_name'] as String,
      map['_iso_639_1'] as String,
      map['_name'] as String,
    );
  }
  String get englishName => _english_name;
  String get iso6391 => _iso_639_1;
  String get name => _name;

  @override
  String toString() =>
      '_Spoken_languages(_english_name: $_english_name, _iso_639_1: $_iso_639_1, _name: $_name)';
}
