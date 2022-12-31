import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class NoMoviesInListWidget extends StatelessWidget {
  const NoMoviesInListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
      child: Text(
        'No Movies added to list yet!',
        style: kCalloutStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
