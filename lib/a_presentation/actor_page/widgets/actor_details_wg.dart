import 'package:a_movie/a_presentation/actor_page/widgets/actor_picture_wg.dart';
import 'package:a_movie/c_domain/actors/actor_details_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class ActorDetailsWidget extends StatelessWidget {
  const ActorDetailsWidget({
    super.key,
    required this.size,
    required this.actor,
  });

  final Size size;
  final ActorDetailsModel actor;

  @override
  Widget build(BuildContext context) {
    ActorDetails detail = actor.details!;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 26.0),
            child: Column(
              children: [
                ActorPictureWidget(
                  size: size,
                  fullImageURL: actor.details!.fullImgURL,
                ),
                SizedBox(height: size.height * 0.035),
                Text(detail.name, style: kTitle3Style),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: size.height * 0.02,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: detail.aka.length,
                    itemBuilder: (context, index) => Text(
                      '${detail.aka[index]} ${index != detail.aka.length - 1 ? ' • ' : ''}',
                      style: kHeadLineStyle.copyWith(color: kBlackColors[600]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  detail.biography,
                  style: kSubheadStyle.copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
