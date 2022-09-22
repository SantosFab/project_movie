import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/search_bloc.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';
import 'package:project_movie/src/style/custom_style.dart';

class SearchPage extends StatefulWidget {
  final String search;
  const SearchPage({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String get pesquisa => widget.search;
  late final SearchBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.getBloc<SearchBloc>();
    _bloc.sink.add(pesquisa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: StreamBuilder<ItemModel>(
        stream: _bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listOfMovie(snapshot);
          }
          return Container();
        },
      ),
    );
  }

  listOfMovie(AsyncSnapshot<ItemModel> snapshot) {
    return Center(
      child: Container(
        width: 320,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          itemCount: snapshot.data!.results.length,
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.hasData) {
              ItemModel movies = snapshot.data!;
              return getMovies(context, movies, index);
            } else if (snapshot.hasError) {
              return const Text(
                  'Não foi possível encontrar um filme, por favor tente novamente');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  GestureDetector getMovies(BuildContext context, ItemModel movies, int index) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageDetail(
            id: movies.results[index].id,
            title: movies.results[index].title,
            overview: movies.results[index].overview,
            releaseDate: movies.results[index].releaseDate,
            backDropPath: movies.results[index].backdropPath,
            voteAverage: movies.results[index].voteAverega,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Card(
          child: Column(
            children: <Widget>[
              Image.network(
                'https://image.tmdb.org/t/p/w500${movies.results[index].posterPath}',
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  movies.results[index].title,
                  style: CustomStyle.feature,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
