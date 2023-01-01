import 'package:a_movie/a_presentation/core/widgets/main_app_bar.dart';
import 'package:a_movie/a_presentation/home_page/widgets/cate_wg.dart';
import 'package:a_movie/a_presentation/home_page/widgets/movies_widget.dart';
import 'package:a_movie/a_presentation/home_page/widgets/trending_movies.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundDec,
      child: ListView(
        children: [
          const MainAppBar(),
          const CategoryWidget(),
          const TredingMoviesWidget(),
          MoviesWidget(text: AppStrings.upcoming, request: 'upcoming'),
          MoviesWidget(text: AppStrings.nowPlaying, request: 'now_playing'),
          MoviesWidget(text: AppStrings.popular, request: 'popular'),
          MoviesWidget(text: AppStrings.topRated, request: 'top_rated'),
        ],
      ),
    );
  }
}
