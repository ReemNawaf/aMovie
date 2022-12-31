import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.size,
  });
  final String title;
  final String subtitle;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColors),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      margin: const EdgeInsets.only(bottom: 16.0, right: 26.0),
      child: SizedBox(
        width: size.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: kFootnoteStyle.copyWith(
                    color: kPrimaryColors, fontWeight: FontWeight.w900)),
            Text(
              subtitle,
              style: kCaption1Style,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              maxLines: 16,
            )
          ],
        ),
      ),
    );
  }
}
