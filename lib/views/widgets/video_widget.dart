import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  // O widget agora recebe a URL do vídeo como parâmetro
  final String videoUrl;

  const YouTubeVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extrair o ID do vídeo a partir da URL fornecida como parâmetro
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    // Inicializar o controlador do player
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      onReady: () {
        print('Player is ready.');
      },
    );
  }
}
