import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.iconData,
    required this.height,
    required this.flex,
  }) : super(key: key);
  final String text;
  final Function() onPressed;
  final IconData iconData;
  final double height;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColors),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextButton.icon(
          style: TextButton.styleFrom(foregroundColor: kPrimaryColors),
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: 25.0,
            color: kWhiteColor,
          ),
          label: Text(
            text,
            style: kCaption1Style,
          ),
        ),
      ),
    );
  }
}
