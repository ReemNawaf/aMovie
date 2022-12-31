import 'package:a_movie/shared/app_colors.dart';
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
        height: size.height * 0.122,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: size.width * 0.13,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  leading,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.5,
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
                    maxLines: 3,
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
