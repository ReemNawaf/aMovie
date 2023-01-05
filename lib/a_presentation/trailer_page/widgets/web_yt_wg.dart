import 'package:a_movie/c_domain/trailers_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WebYouTubeWidget extends StatelessWidget {
  const WebYouTubeWidget(this.data, {super.key});
  final TrailersModel data;
  @override
  Widget build(BuildContext context) {
    List<Video>? videos = data.trailers;

    final controller = YoutubePlayerController.fromVideoId(
      videoId: videos![0].key!,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    return YoutubePlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    );
  }
}
