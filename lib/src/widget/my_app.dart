import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/floating_bloc.dart';
import 'package:project_movie/src/blocs/movies_bloc.dart';
import 'package:project_movie/src/blocs/trailer_bloc.dart';
import 'package:project_movie/src/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => MoviesBloc()),
        Bloc((i) => TrailerBloc()),
        Bloc((i) => FloatingBloc()),
      ],
      dependencies: const [],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
