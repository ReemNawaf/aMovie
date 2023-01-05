import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:flutter/material.dart';

class ActorPictureWidget extends StatelessWidget {
  const ActorPictureWidget({
    super.key,
    required this.fullImageURL,
    required this.size,
  });
  final Size size;
  final String fullImageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 26.0, left: 26.0),
      width: isPhone() ? size.width * 0.8 : screenWidth(size) * 0.8,
      height: isPhone() ? size.height * 0.5 : screenWidth(size) * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: kBlackColors[500]!,
            blurRadius: 100.0,
            spreadRadius: 1.0,
            offset: const Offset(15.0, 15.0),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            fullImageURL,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
