import 'package:a_movie/a_presentation/home_page/widgets/movie_card_skeleton_wg.dart';
import 'package:a_movie/a_presentation/home_page/widgets/movie_card_wg.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/c_domain/movie/movie_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimilarMoviesWidget extends ConsumerWidget {
  const SimilarMoviesWidget({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20),
            child: Text(
              'Similar ${AppStrings.movie}',
              style: kSubheadStyle.copyWith(color: kBlackColors[600]),
            ),
          ),
          const SizedBox(height: 5.0),
          FutureBuilder<MovieModel>(
            future: ref.read(movieRepoProvider).getSimilarMovies(id),
            builder: (context, AsyncSnapshot<MovieModel> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error != null &&
                    snapshot.data!.error!.isNotEmpty) {
                  return _buildErrorWidget(snapshot.data!.error);
                }
                return _buildMoviesWidget(data: snapshot.data!, size: size);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else {
                return _buildLoadingWidget(size);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget(Size size) {
    return SizedBox(
      height: size.height * 0.27,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) => MovieCardSkeletonWidget(size: size),
      ),
    );
  }

  //display error
  Widget _buildErrorWidget(dynamic error) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPad),
      child: Text(
        'Oops, similar movies list couldn\'t be loaded, check your internect connection.',
        textAlign: TextAlign.center,
        style: kFootnoteStyle.copyWith(
          color: kBlackColors[600],
        ),
      ),
    );
  }

  Widget _buildMoviesWidget({required MovieModel data, required Size size}) {
    List<Movie>? movies = data.movies;
    if (movies!.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          'No movies found',
          style: kCaption1Style.copyWith(color: kPrimaryColors),
        ),
      );
    } else {
      return SizedBox(
        height: size.height * 0.27,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) => MovieCardWidget(
            movie: movies[index],
            size: size,
            request: 'similar',
          ),
        ),
      );
    }
  }
}
