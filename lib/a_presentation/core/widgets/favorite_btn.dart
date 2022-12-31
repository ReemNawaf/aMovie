import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
    this.isFavorite = true,
    required this.size,
    this.iconSmaller = false,
    required this.movie,
  });
  final bool isFavorite;
  final Size size;
  final bool iconSmaller;
  final MovieDetails movie;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  final Box<HiveMovieModel> _favoriteMoviesList =
      Hive.box<HiveMovieModel>('movie_favorite_list');

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesListIds = _favoriteMoviesList.values
        .toList()
        .map((hiveMovie) => hiveMovie.id)
        .toList();

    final isInFavoriteList = favoriteMoviesListIds.contains(widget.movie.id);

    final imagePath = isInFavoriteList ? 'heart-fill' : 'heart-outline';
    return SizedBox(
      width: widget.iconSmaller
          ? widget.size.width * 0.1
          : widget.size.width * 0.137,
      height: widget.iconSmaller
          ? widget.size.width * 0.1
          : widget.size.width * 0.137,
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/$imagePath.svg',
          color: kRedsColor[400],
        ),
        onPressed: () {
          if (isInFavoriteList) {
            final movieIndex = favoriteMoviesListIds.indexOf(widget.movie.id);

            setState(() {
              _favoriteMoviesList.deleteAt(movieIndex);
            });
          } else {
            HiveMovieModel newValue = HiveMovieModel(
              id: widget.movie.id,
              rating: widget.movie.rating,
              title: widget.movie.title,
              poster: widget.movie.poster,
              overview: widget.movie.overview,
            );
            setState(() {
              _favoriteMoviesList.add(newValue);
            });
          }
        },
      ),
    );
  }
}
