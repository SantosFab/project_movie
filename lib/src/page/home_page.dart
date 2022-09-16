import 'dart:math';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/floating_bloc.dart';
import 'package:project_movie/src/blocs/movies_bloc.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';
import 'package:project_movie/src/style/custom_color.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final MoviesBloc _blocMovies;
  late final FloatingBloc _blocFloating;
  int page = 1;

  @override
  void initState() {
    super.initState();
    _blocMovies = BlocProvider.getBloc<MoviesBloc>();
    _blocFloating = BlocProvider.getBloc<FloatingBloc>();
    _blocMovies.sink.add(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Filmes populares')),
      ),
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
      floatingActionButton: StreamBuilder<int>(
          stream: _blocFloating.stream,
          initialData: 1,
          builder: (context, snapshot) {
            if (snapshot.data == 1) {
              return FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  _blocMovies.sink.add(++page);
                  if (page > 1) {
                    _blocFloating.sink.add(page);
                  }
                },
                child: const Icon(Icons.arrow_circle_right),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () {
                    _blocMovies.sink.add(--page);
                    if (page == 1) {
                      _blocFloating.sink.add(page);
                    }
                  },
                  backgroundColor: CustomColor.white,
                  child: const Icon(Icons.arrow_circle_left),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: 'btn2',
                  backgroundColor: Colors.white,
                  onPressed: () => _blocMovies.sink.add(++page),
                  child: const Icon(Icons.arrow_circle_right),
                ),
              ],
            );
          }),
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
