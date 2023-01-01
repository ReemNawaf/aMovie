import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieInfoBox extends StatelessWidget {
  const MovieInfoBox({
    super.key,
    required this.label,
    required this.detail,
    required this.icon,
    required this.size,
  });
  final String label;
  final String detail;
  final String icon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: kWhiteColor),
      ),
      width: size.width * 0.2,
      height: size.width * 0.21,
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/$icon.svg'),
          const SizedBox(height: 2.0),
          Text(
            label,
            style: kCaption1Style,
          ),
          Text(
            detail,
            style: kCaption2Style,
          ),
        ],
      ),
    );
  }
}
