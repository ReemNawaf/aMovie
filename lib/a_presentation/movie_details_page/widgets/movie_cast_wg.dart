import 'package:a_movie/a_presentation/actor_page/actor_details_page.dart';
import 'package:a_movie/c_domain/actors/actor_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({super.key, required this.actors, required this.size});
  final List<Actor> actors;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: kSubheadStyle.copyWith(color: kBlackColors[600]),
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height:
                isPhone() ? size.height * 0.129 : screenStandardHight * 0.15,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: actors.length,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ActorDetailsPage(id: actors[index].id))),
                    child: ActorWidget(
                      actor: actors[index],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class ActorWidget extends StatelessWidget {
  const ActorWidget({super.key, required this.actor});
  final Actor actor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          if (actor.imagePath != null)
            CircleAvatar(
              backgroundImage: NetworkImage(
                actor.fullImgURL,
              ),
              radius: circleAvatarRadius,
            )
          else
            CircleAvatar(
              backgroundColor: kBlackColors[500],
              backgroundImage:
                  const AssetImage('assets/icons/videocam-off-outline.png'),
              radius: circleAvatarRadius,
            ),
          const SizedBox(height: 4.0),
          Text(
            actor.name ?? '',
            style: kCaption1Style.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            actor.character ?? '',
            style: kCaption1Style.copyWith(
                fontWeight: FontWeight.w600, color: kBlackColors[600]),
          ),
        ],
      ),
    );
  }
}
