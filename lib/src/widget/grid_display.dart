import 'package:flutter/material.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';
import 'package:project_movie/src/utils/url_default.dart';

class GridDisplay extends StatelessWidget {
  final AsyncSnapshot<ItemModel> snapshot;

  const GridDisplay({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        itemCount: snapshot.data!.results.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 250),
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  '${UrlDefault.urlImgw500}${movies.results[index].posterPath}',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
