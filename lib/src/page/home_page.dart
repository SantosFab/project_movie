import 'package:flutter/material.dart';
import 'package:project_movie/src/page/movie_page.dart';
import 'package:project_movie/src/utils/genres.dart';
import 'package:project_movie/src/widget/text_from.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _fromKey = GlobalKey();

  final TextEditingController _controller = TextEditingController();
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Filmes'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
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
  }
}
