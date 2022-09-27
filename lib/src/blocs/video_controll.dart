import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoControll {
  final String key;
  late final YoutubePlayerController _controller;
  VideoControll({required this.key}) {
    _creatController();
  }

  _creatController() {
    _controller = YoutubePlayerController(
      initialVideoId: key,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        enableCaption: true,
        captionLanguage: 'pt',
        disableDragSeek: true,
        controlsVisibleAtStart: false,
        hideControls: true,
      ),
    );
  }

  YoutubePlayerController get video => _controller;

  dispose() {
    _controller.dispose();
  }
}
