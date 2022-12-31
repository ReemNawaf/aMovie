import 'package:a_movie/c_domain/genres/genres_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieGenresWidget extends StatelessWidget {
  const MovieGenresWidget({
    super.key,
    required this.label,
    required this.genres,
    required this.icon,
    required this.size,
  });
  final String label;
  final List<Genre> genres;
  final String icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: kWhiteColor),
      ),
      width: size.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset('assets/icons/video-play.svg'),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: kCaption1Style,
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            itemCount: genres.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) => Text(
                  genres[index].name,
                  style: kCaption2Style,
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
