import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class MovieCardSkeletonWidget extends StatelessWidget {
  const MovieCardSkeletonWidget({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.2,
            decoration: movieCardDec,
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 4.0),
          ),
          const SizedBox(height: 8),
          Container(
            width: size.width * 0.25,
            height: size.height * 0.013,
            decoration: movieCardDec.copyWith(
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 4.0),
          ),
          const SizedBox(height: 8),
          Container(
            width: size.width * 0.15,
            height: size.height * 0.013,
            decoration: movieCardDec.copyWith(
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            alignment: Alignment.topRight,
            padding: const EdgeInsets.only(right: 4.0),
          ),
        ],
      ),
    );
  }
}
