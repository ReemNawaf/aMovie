import 'package:a_movie/a_presentation/saved_movies_page/favorite_movies_list.dart';
import 'package:a_movie/a_presentation/saved_movies_page/watch_movies_list.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../core/widgets/web_app_ground.dart';

class SavedMoviesPage extends StatelessWidget {
  static const String route = 'saved_movies_page';

  const SavedMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: WebAppGround(
          child: SizedBox(
            width: screenWidth(size),
            height: screenHeight(size),
            child: Container(
              decoration: kBackgroundDec,
              padding: EdgeInsets.only(top: size.height * 0.1),
              height: size.height,
              child: Column(
                children: [
                  const TabBar(
                    indicatorWeight: 5,
                    indicatorColor: kPrimaryColors,
                    labelPadding: EdgeInsets.only(bottom: 16.0),
                    tabs: [
                      Text('Favorite Movies', style: kCalloutStyle),
                      Text('Watching List', style: kCalloutStyle),
                    ],
                  ),
                  Container(
                    padding: isPhone()
                        ? const EdgeInsets.all(0.0)
                        : const EdgeInsets.only(
                            top: 20.0,
                            left: 20.0,
                            right: 20.0,
                          ),
                    height: isPhone()
                        ? size.height * 0.75
                        : screenHeight(size) * 0.836,
                    width: size.width * 0.9,
                    child: TabBarView(
                      children: [
                        FavoriteMoviesList(size),
                        WatchMoviesList(size),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
