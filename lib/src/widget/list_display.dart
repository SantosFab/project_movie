import 'package:flutter/material.dart';
import 'package:project_movie/src/models/item_model.dart';
import 'package:project_movie/src/page/page_detail.dart';
import 'package:project_movie/src/style/custom_style.dart';

class ListDisplay extends StatelessWidget {
  final AsyncSnapshot<ItemModel> snapshot;

  const ListDisplay({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          itemCount: snapshot.data!.results.length,
          itemBuilder: (BuildContext context, int index) {
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SizedBox(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${movies.results[index].posterPath}',
                          height: 360,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            movies.results[index].title,
                            style: CustomStyle.feature,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
