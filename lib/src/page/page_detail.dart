// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:project_movie/src/style/custom_style.dart';

class PageDetail extends StatelessWidget {
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
              Text('Trailer', style: CustomStyle.textTitle),
              Container(
                height: 100,
                width: 200,
                color: Colors.grey,
                child: const Icon(Icons.play_arrow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
