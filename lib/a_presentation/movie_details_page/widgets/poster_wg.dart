import 'package:a_movie/a_presentation/core/widgets/favorite_btn.dart';
import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PosterWidget extends StatelessWidget {
  PosterWidget({
    super.key,
    required this.fullImageURL,
    required this.size,
    required this.movie,
  });
  final Size size;
  final String fullImageURL;
  final MovieDetails movie;

  final Box<HiveMovieModel> _favoriteMoviesList =
      Hive.box<HiveMovieModel>('movie_favorite_list');

  @override
  Widget build(BuildContext context) {
    final hiveList = _favoriteMoviesList.values
        .toList()
        .map((hiveMovie) => hiveMovie.id)
        .toList();
    final isInFavoriteList = hiveList.contains(movie.id);

    return Container(
      width: size.width * 0.6,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: kBlackColors[500]!,
            blurRadius: 100.0,
            spreadRadius: 1.0,
            offset: const Offset(15.0, 15.0),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            fullImageURL,
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
      child: FavoriteButton(
        size: size,
        isFavorite: isInFavoriteList,
        movie: movie,
      ),
    );
  }
}
