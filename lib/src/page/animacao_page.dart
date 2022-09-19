import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/movies_animacao_bloc.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';

class AnimacaoPage extends StatefulWidget {
  const AnimacaoPage({Key? key}) : super(key: key);

  @override
  State<AnimacaoPage> createState() => _AnimacaoPageState();
}

class _AnimacaoPageState extends State<AnimacaoPage> {
  late final MoviesAnimacaoBloc _blocMovies;

  int page = 1;

  @override
  void initState() {
    super.initState();
    _blocMovies = BlocProvider.getBloc<MoviesAnimacaoBloc>();

    _blocMovies.sink.add(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StreamBuilder<ItemModel>(
          stream: _blocMovies.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Ocorreu um error: ${snapshot.error}',
                ),
              );
            }
            if (snapshot.hasData) {
              return _gridview(snapshot.data!);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _gridview(ItemModel movies) {
    return GridView.builder(
      itemCount: movies.results.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PageDetail(
              id: movies.results[index].id,
              title: movies.results[index].title,
              overview: movies.results[index].overview,
              releaseDate: movies.results[index].releaseDate,
              backDropPath: movies.results[index].backdropPath,
              voteAverage: movies.results[index].voteAverega,
            ),
          )),
          child: Padding(
            padding: const EdgeInsetsDirectional.all(4),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movies.results[index].posterPath}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
