import 'package:a_movie/a_presentation/core/widgets/favorite_btn.dart';
import 'package:a_movie/a_presentation/movie_details_page/movie_details_page.dart';
import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/c_domain/movie/movie_model.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MovieCardWidget extends StatelessWidget {
  MovieCardWidget({
    super.key,
    required this.size,
    required this.request,
    required this.movie,
  });

  final Size size;
  final String request;
  final Movie movie;

  final Box<HiveMovieModel> _favoriteMoviesList =
      Hive.box<HiveMovieModel>('movie_favorite_list');

  @override
  Widget build(BuildContext context) {
    final hiveList = _favoriteMoviesList.values
        .toList()
        .map((hiveMovie) => hiveMovie.id)
        .toList();
    final isInFavoriteList = hiveList.contains(movie.id);

    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MoviesDetailsPage(
              id: movie.id!,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Hero(
              tag: '${movie.id}$request',
              child: Container(
                width: size.width * 0.3,
                height: size.height * 0.2,
                decoration: movie.poster != null
                    ? movieCardDec.copyWith(
                        image: DecorationImage(
                          image: NetworkImage(movie.fullImgURL),
                          fit: BoxFit.cover,
                        ),
                      )
                    : movieCardDec.copyWith(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/icons/videocam-off-outline.png'),
                          fit: BoxFit.contain,
                          opacity: 0.6,
                        ),
                      ),
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(right: 4.0),
                child: FavoriteButton(
                  movie: MovieDetails(
                    id: movie.id!,
                    genres: [],
                    releaseDate: '',
                    overview: movie.overview!,
                    backDrop: movie.backDrop ?? '',
                    poster: movie.poster ?? '',
                    rating: movie.rating ?? 0,
                    title: movie.title!,
                    runtime: 0,
                    cast: [],
                  ),
                  size: size,
                  iconSmaller: true,
                  isFavorite: isInFavoriteList,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              width: size.width * 0.26,
              child: Text(
                movie.title!.trim(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: kCaption1Style,
              ),
            ),
            RatingGenresLine(
              rating: movie.rating ?? 0,
              genres: movie.genre,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingGenresLine extends ConsumerWidget {
  const RatingGenresLine({Key? key, required this.rating, required this.genres})
      : super(key: key);

  final double rating;
  final List<int> genres;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref.read(movieRepoProvider).genreIdToName(genres),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Text(
              '$rating  •  ${snapshot.data!.first}',
              style: kCaption1Style.copyWith(color: kBlackColors[600]),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
