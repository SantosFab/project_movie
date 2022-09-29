import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_movie/src/utils/video_controll.dart';
import 'package:project_movie/src/models/trailer_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerView extends StatefulWidget {
  final Results trailer;
  const YoutubePlayerView({Key? key, required this.trailer}) : super(key: key);

  @override
  State<YoutubePlayerView> createState() => _YoutubePlayerViewState();
}

class _YoutubePlayerViewState extends State<YoutubePlayerView> {
  Results get video => widget.trailer;
  late final VideoControll _controll;

  @override
  void initState() {
    super.initState();
    _controll = VideoControll(key: video.key);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        if (_controll.video.value.isPlaying) {
          Navigator.pop(context);
          _controll.video.pause();
        }
      },
      player: YoutubePlayer(
        controller: _controll.video,
        onEnded: (metaData) => Navigator.pop(context),
      ),
      builder: (p0, player) {
        return Column(
          children: [
            player,
          ],
        );
      },
    );
  }
}
