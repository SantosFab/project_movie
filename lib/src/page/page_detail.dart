// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/trailer_bloc.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/style/custom_style.dart';

class PageDetail extends StatefulWidget {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String backDropPath;
  final double voteAverage;

  const PageDetail({
    Key? key,
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.backDropPath,
    required this.voteAverage,
  }) : super(key: key);

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  int get id => widget.id;
  String get title => widget.title;
  String get overview => widget.overview;
  String get releaseDate => widget.releaseDate;
  String get backDropPath => widget.backDropPath;
  double get voteAverage => widget.voteAverage;

  final bloc = BlocProvider.getBloc<TrailerBloc>();
  final PageController controller = PageController(viewportFraction: 1 / 2);
  @override
  void initState() {
    super.initState();
    bloc.sink.add(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500$backDropPath',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: CustomStyle.textTitle,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.favorite)),
                  Text(
                    voteAverage.toString(),
                    style: CustomStyle.feature,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    releaseDate,
                    style: CustomStyle.feature,
                  ),
                ],
              ),
              Text(
                overview,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 10),
              StreamBuilder<TrailerModel>(
                stream: bloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.results.isEmpty) {
                      return Text(
                        'Não há trailer',
                        style: CustomStyle.textTitle,
                      );
                    }
                    return _viewTrailer(snapshot);
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _viewTrailer(AsyncSnapshot<TrailerModel> snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trailer', style: CustomStyle.textTitle),
        SizedBox(
          height: 140,
          child: PageView.builder(
            padEnds: false,
            controller: controller,
            itemCount: snapshot.data!.results.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      constraints: const BoxConstraints.expand(),
                      color: Colors.grey,
                      child: const Icon(Icons.play_arrow),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      snapshot.data!.results[index].name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
