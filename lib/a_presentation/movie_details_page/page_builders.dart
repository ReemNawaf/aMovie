import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context,
    {required String title, required String listType}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Added to $listType List'),
        content: Text('$title successfully added to $listType list'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      );
    },
  );
}

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
      'Oops, movie details couldn\'t be, check your internect connection.',
      textAlign: TextAlign.center,
      style: kFootnoteStyle.copyWith(
        color: kBlackColors[600],
      ),
    ),
  );
}
