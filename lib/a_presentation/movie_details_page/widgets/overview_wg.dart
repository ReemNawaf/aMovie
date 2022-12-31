import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key, required this.overview});
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Plot Summary',
          style: kSubheadStyle.copyWith(color: kBlackColors[600]),
        ),
        const SizedBox(height: 5),
        Text(
          overview,
          style: kCaption1Style.copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
