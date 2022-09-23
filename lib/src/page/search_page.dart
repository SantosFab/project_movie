import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/search_bloc.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/style/custom_style.dart';
import 'package:project_movie/src/widget/grid_display.dart';

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
          if (snapshot.hasError) {
            return const Text(
                'Não foi possível encontrar um filme, por favor tente novamente');
          } else if (snapshot.hasData && snapshot.data!.results.isEmpty) {
            return Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  'Não foi encontrar nenhum filme',
                  textAlign: TextAlign.center,
                  style: CustomStyle.textTitle,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridDisplay(snapshot: snapshot),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
