import 'package:a_movie/a_presentation/actor_page/widgets/actor_picture_wg.dart';
import 'package:a_movie/c_domain/actors/actor_details_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
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
    return ListView(
      children: [
        ActorPictureWidget(
          size: size,
          fullImageURL: actor.details!.fullImgURL,
        ),
        SizedBox(
            height:
                isPhone() ? size.height * 0.035 : screenHeight(size) * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPad),
          child: Text(
            detail.name,
            style: kTitle3Style,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
            height: isPhone() ? size.height * 0.01 : screenHeight(size) * 0.03),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kHorPad),
          height: isPhone() ? size.height * 0.03 : screenHeight(size) * 0.03,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: detail.aka.length,
            itemBuilder: (context, index) => Text(
              '${detail.aka[index]} ${index != detail.aka.length - 1 ? ' • ' : ''}',
              style: kHeadLineStyle.copyWith(color: kBlackColors[600]),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
            height: isPhone() ? size.height * 0.01 : screenHeight(size) * 0.01),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPad),
          child: Text(
            detail.biography,
            style: kSubheadStyle.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
