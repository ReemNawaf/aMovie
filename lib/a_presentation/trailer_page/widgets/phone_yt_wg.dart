import 'package:a_movie/c_domain/trailers_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PhoneYouTubeWidget extends StatelessWidget {
  const PhoneYouTubeWidget(this.data, {super.key});
  final TrailersModel data;
  @override
  Widget build(BuildContext context) {
    List<Video>? videos = data.trailers;
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videos![0].key!,
        flags: const YoutubePlayerFlags(
          hideControls: true,
          autoPlay: true,
        ),
      ),
    );
  }
}
