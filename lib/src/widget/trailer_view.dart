import 'package:flutter/material.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:project_movie/src/widget/youtube_player_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerView extends StatelessWidget {
  final Results trailer;
  const TrailerView({super.key, required this.trailer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => YoutubePlayerView(trailer: trailer),
              ),
            ),
            child: Image.network(
              YoutubePlayer.getThumbnail(videoId: trailer.key),
            ),
          ),
          Text(
            trailer.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
