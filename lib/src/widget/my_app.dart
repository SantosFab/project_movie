import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'package:project_movie/src/blocs/movies_animacao_bloc.dart';
import 'package:project_movie/src/blocs/movies_drama.dart';
import 'package:project_movie/src/blocs/movies_ficcao_bloc.dart';
import 'package:project_movie/src/blocs/movies_popular_bloc.dart';
import 'package:project_movie/src/blocs/trailer_bloc.dart';
import 'package:project_movie/src/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => MoviesPopularBloc()),
        Bloc((i) => TrailerBloc()),
        Bloc((i) => MoviesAnimacaoBloc()),
        Bloc((i) => MoviesDramaBloc()),
        Bloc((i) => MoviesFiccaoBloc()),
      ],
      dependencies: const [],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: const HomePage(),
      ),
    );
  }
}
