import 'package:a_movie/a_presentation/movie_details_page/widgets/movie_actions_row.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/movie_cast_wg.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/movie_genres_wg.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/movie_info_box.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/overview_wg.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/poster_wg.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/similar_movies_wg.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/reviews.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    super.key,
    required this.size,
    required this.movie,
  });

  final Size size;
  final MovieDetailsModel movie;

  @override
  Widget build(BuildContext context) {
    MovieDetails detail = movie.details!;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PosterWidget(
                      movie: movie.details!,
                      size: size,
                      fullImageURL: movie.details!.fullImgURL,
                    ),
                    SizedBox(
                      height: size.height * 0.42,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MovieGenresWidget(
                            size: size,
                            label: AppStrings.genre,
                            genres: movie.details!.genres,
                            icon: 'genre',
                          ),
                          MovieInfoBox(
                            size: size,
                            label: 'Duration',
                            detail: '${movie.details!.runtime} mins',
                            icon: 'clock',
                          ),
                          MovieInfoBox(
                            size: size,
                            label: 'Rating',
                            detail: '${movie.details!.rating}',
                            icon: 'star',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Text(movie.details!.title, style: kTitle3Style),
                SizedBox(height: size.height * 0.02),
                MovieActionsRow(
                  context,
                  movie: movie.details!,
                  size: size,
                ),
                SizedBox(height: size.height * 0.025),
                OverviewWidget(overview: detail.overview),
                SizedBox(height: size.height * 0.01),
              ],
            ),
          ),
          MovieCastWidget(actors: movie.details!.cast, size: size),
          SizedBox(height: size.height * 0.01),
          SimilarMoviesWidget(id: movie.details!.id),
          SizedBox(height: size.height * 0.01),
          Reviews(id: movie.details!.id),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    );
  }
}
