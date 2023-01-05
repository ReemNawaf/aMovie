import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class ListMovieCard extends StatelessWidget {
  const ListMovieCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onTap,
    required this.size,
  });
  final String title;
  final String subtitle;
  final String leading;
  final Widget trailing;
  final Function() onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColors),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: isPhone() ? size.height * 0.122 : screenWidth(size) * 0.3,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: isPhone() ? size.width * 0.12 : screenWidth(size) * 0.18,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(leading, fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/icons/videocam-off-outline.png',
                    fit: BoxFit.contain,
                    color: kBlackColors[600],
                  );
                }),
              ),
            ),
            SizedBox(
              width: isPhone() ? size.width * 0.5 : screenWidth(size) * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kFootnoteStyle.copyWith(
                      color: kPrimaryColors,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: isPhone() ? kCaption1Style : kCaption2Style,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                  )
                ],
              ),
            ),
            trailing
          ],
        ),
      ),
    );
  }
}
