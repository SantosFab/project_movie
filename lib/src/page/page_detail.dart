// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:project_movie/src/blocs/trailer_bloc.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/style/custom_style.dart';
import 'package:project_movie/src/utils/url_default.dart';
import 'package:project_movie/src/widget/trailer_view.dart';

class PageDetail extends StatefulWidget {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final String? backDropPath;
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
  String? get backDropPath => widget.backDropPath;
  double get voteAverage => widget.voteAverage;

  late final TrailerBloc _bloc;
  late final PageController _controllerPage;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.getBloc<TrailerBloc>();
    _controllerPage = PageController(viewportFraction: 1 / 2);
    _bloc.sink.add(id);
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
                child: backDropPath != null
                    ? Image.network(
                        '${UrlDefault.urlImgw500}$backDropPath',
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                          'Esse filme não possui backDropPath',
                          style: CustomStyle.feature,
                        ),
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
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                  ),
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
                stream: _bloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.results.isEmpty) {
                      return Text(
                        'Não há trailer',
                        style: CustomStyle.textTitle,
                      );
                    }
                    TrailerModel trailer = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trailer', style: CustomStyle.textTitle),
                        SizedBox(
                          height: 305,
                          child: PageView.builder(
                            padEnds: false,
                            controller: _controllerPage,
                            itemCount: trailer.results.length,
                            itemBuilder: (context, index) {
                              if (trailer.results[index].site == 'YouTube') {
                                return TrailerView(
                                  trailer: trailer.results[index],
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    const Text('Error, não foi possível obter trailer');
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
}
