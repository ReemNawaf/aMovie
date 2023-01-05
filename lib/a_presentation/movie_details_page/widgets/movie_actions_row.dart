import 'package:a_movie/a_presentation/core/widgets/app_btn.dart';
import 'package:a_movie/a_presentation/trailer_page/trailer_screen.dart';
import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MovieActionsRow extends StatefulWidget {
  final Size size;
  final BuildContext context;
  final MovieDetails movie;
  const MovieActionsRow(
    this.context, {
    super.key,
    required this.movie,
    required this.size,
  });

  @override
  State<MovieActionsRow> createState() => _MovieActionsRowState();
}

class _MovieActionsRowState extends State<MovieActionsRow> {
  final Box<HiveMovieModel> _watchingMoviesList =
      Hive.box<HiveMovieModel>('movie_watching_list');

  @override
  Widget build(BuildContext context) {
    final watchingMoviesListIds = _watchingMoviesList.values
        .toList()
        .map((hiveMovie) => hiveMovie.id)
        .toList();
    final isInWatchingList = watchingMoviesListIds.contains(widget.movie.id);

    return Row(
      children: [
        AppButton(
          height: widget.size.height * 0.055,
          flex: 2,
          iconData: Icons.play_circle_fill_rounded,
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  TrailersScreen(shows: 'movie', id: widget.movie.id),
            ),
          ),
          text: 'Watch Trailer',
        ),
        SizedBox(
            width: isPhone()
                ? widget.size.width * 0.03
                : screenWidth(widget.size) * 0.02),
        AppButton(
          height: widget.size.height * 0.055,
          flex: 3,
          iconData: isInWatchingList ? Icons.delete : Icons.list_alt_outlined,
          onPressed: () {
            if (isInWatchingList) {
              final movieIndex = watchingMoviesListIds.indexOf(widget.movie.id);

              setState(() {
                _watchingMoviesList.deleteAt(movieIndex);
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
                _watchingMoviesList.add(newValue);
              });
            }
          },
          text: isInWatchingList ? 'Delete This' : 'Add To My Watching List',
        ),
      ],
    );
  }
}
