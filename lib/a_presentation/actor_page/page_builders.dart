import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

Widget buildLoadingWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          width: 25.0,
          height: 25.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 4.0,
          ),
        )
      ],
    ),
  );
}

Widget buildErrorWidget(dynamic error) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kHorPad),
    child: Text(
      'Oops, actor details couldn\'t be, check your internect connection.',
      textAlign: TextAlign.center,
      style: kFootnoteStyle.copyWith(
        color: kBlackColors[600],
      ),
    ),
  );
}
