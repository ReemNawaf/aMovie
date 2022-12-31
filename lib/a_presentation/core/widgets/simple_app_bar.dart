import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            'assets/icons/arrow-ios-backward.svg',
            color: kWhiteColor,
            width: 25,
          ),
        ),
        const Expanded(flex: 2, child: SizedBox()),
        Text(
          title ?? '',
          style: kSubheadStyle,
        ),
        const Expanded(flex: 3, child: SizedBox())
      ],
    );
  }
}
