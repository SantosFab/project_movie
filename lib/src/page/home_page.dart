import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/display_bloc.dart';
import 'package:project_movie/src/page/movie_page.dart';
import 'package:project_movie/src/page/search_page.dart';
import 'package:project_movie/src/utils/genres.dart';
import 'package:project_movie/src/widget/text_from.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final GlobalKey<FormState> _fromKey;
  late final TextEditingController _controller;
  late final TabController _tabController;
  late final DisplayBloc _bloc;
  @override
  void initState() {
    _fromKey = GlobalKey();
    _controller = TextEditingController();
    _tabController = TabController(length: 4, vsync: this);
    _bloc = BlocProvider.getBloc<DisplayBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filmes'),
          actions: [
            IconButton(
              onPressed: () => _bloc.sink.add(false),
              icon: const Icon(Icons.list),
            ),
            IconButton(
              onPressed: () => _bloc.sink.add(true),
              icon: const Icon(Icons.grid_on),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(110),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Form(
                    key: _fromKey,
                    child: TextFrom(
                      controller: _controller,
                      submitted: _getMovie,
                    ),
                  ),
                  TabBar(
                    labelPadding: const EdgeInsets.only(top: 14),
                    controller: _tabController,
                    tabs: const [
                      Text('Aventura'),
                      Text('Ficção'),
                      Text('Drama'),
                      Text('Animação'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            MoviePage(type: Genres.aventura),
            MoviePage(type: Genres.ficcao),
            MoviePage(type: Genres.drama),
            MoviePage(type: Genres.animacao),
          ],
        ),
      ),
    );
  }

  void _getMovie(String value) {
    final FormState? from = _fromKey.currentState;
    if (from != null && !from.validate()) {
      return;
    }
    String textSearch = _controller.text.replaceAll(' ', '+').toLowerCase();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SearchPage(search: textSearch),
      ),
    );
  }
}
