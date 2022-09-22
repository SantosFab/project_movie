import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/movies_bloc.dart';
import 'package:project_movie/src/blocs/display_bloc.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/widget/grid_display.dart';
import 'package:project_movie/src/widget/list_display.dart';

class MoviePage extends StatefulWidget {
  final String type;
  const MoviePage({Key? key, required this.type}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  String get type => widget.type;
  late final MoviesBloc _blocMovies;
  late final DisplayBloc _blocDisplay;

  @override
  void initState() {
    super.initState();
    _blocMovies = BlocProvider.getBloc<MoviesBloc>();
    _blocDisplay = BlocProvider.getBloc<DisplayBloc>();
    _blocMovies.sink.add(type);
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
              AsyncSnapshot<ItemModel> movies = snapshot;

              return StreamBuilder(
                stream: _blocDisplay.stream,
                initialData: true,
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return GridDisplay(snapshot: movies);
                  }
                  return ListDisplay(snapshot: movies);
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
