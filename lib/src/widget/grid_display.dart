import 'package:flutter/material.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';

class GridDisplay extends StatelessWidget {
  final AsyncSnapshot<ItemModel> snapshot;

  const GridDisplay({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data!.results.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        ItemModel movies = snapshot.data!;
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PageDetail(
                id: movies.results[index].id,
                title: movies.results[index].title,
                overview: movies.results[index].overview,
                releaseDate: movies.results[index].releaseDate,
                backDropPath: movies.results[index].backdropPath,
                voteAverage: movies.results[index].voteAverega,
              ),
            ),
          ),
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
