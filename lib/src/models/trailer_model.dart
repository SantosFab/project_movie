// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:convert';

class TrailerModel {
  final int _id;
  final List<_Results> _results;

  TrailerModel(
    this._id,
    this._results,
  );

  factory TrailerModel.fromMap(Map<String, dynamic> map) {
    return TrailerModel(
      map['id'] as int,
      List<_Results>.from(
        (map['results'] as List<dynamic>).map(
          (x) => _Results.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory TrailerModel.fromJson(String source) =>
      TrailerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  int get id => _id;
  List<_Results> get results => _results;

  @override
  String toString() => 'TrailerModel(_id: $_id, _results: $_results)';
}

class _Results {
  final String _iso_639_1;
  final String _iso_3166_1;
  final String _name;
  final String _key;
  final String _site;
  final int _size;
  final String _type;
  final bool _official;
  final String _published_at;
  final String _id;

  _Results(
    this._iso_639_1,
    this._iso_3166_1,
    this._name,
    this._key,
    this._site,
    this._size,
    this._type,
    this._official,
    this._published_at,
    this._id,
  );

  factory _Results.fromMap(Map<String, dynamic> map) {
    return _Results(
        map['iso_639_1'] as String,
        map['iso_3166_1'] as String,
        map['name'] as String,
        map['key'] as String,
        map['site'] as String,
        map['size'] as int,
        map['type'] as String,
        map['official'] as bool,
        map['published_at'] as String,
        map['id'] as String);
  }

  String get iso6391 => _iso_639_1;
  String get iso31661 => _iso_3166_1;
  String get name => _name;
  String get key => _key;
  String get site => _site;
  int get size => _size;
  String get type => _type;
  bool get official => _official;
  String get publishedAt => _published_at;
  String get id => _id;

  @override
  String toString() {
    return '_Results(_iso_639_1: $_iso_639_1, _iso_3166_1: $_iso_3166_1, _name: $_name, _key: $_key, _site: $_site, _size: $_size, _type: $_type, _official: $_official, _published_at: $_published_at, _id: $_id)';
  }
}
