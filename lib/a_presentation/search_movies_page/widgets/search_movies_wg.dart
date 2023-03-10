import 'package:a_movie/a_presentation/home_page/widgets/movie_card_skeleton_wg.dart';
import 'package:a_movie/a_presentation/home_page/widgets/movie_card_wg.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/c_domain/movie/movie_model.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchMoviesWidget extends ConsumerWidget {
  const SearchMoviesWidget({
    super.key,
    required this.searchKey,
  });
  final String? searchKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return FutureBuilder<MovieModel>(
      future: searchKey != null
          ? ref.read(movieRepoProvider).searchMovies(searchKey!)
          : ref.read(movieRepoProvider).getTrendingMovies('week'),
      builder: (context, AsyncSnapshot<MovieModel> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error != null &&
              snapshot.data!.error!.isNotEmpty) {
            return _buildErrorWidget(snapshot.data!.error);
          } else {
            return _buildMoviesWidget(context,
                data: snapshot.data!, size: size);
          }
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else {
          return _buildLoadingWidget(size);
        }
      },
    );
  }
}

Widget _buildLoadingWidget(Size size) {
  return SizedBox(
    height: size.height * 0.744,
    child: GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 0.67,
      ),
      scrollDirection: Axis.vertical,
      itemCount: 12,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 16),
        child: MovieCardSkeletonWidget(
          size: size * 1.35,
        ),
      ),
    ),
  );
}

Widget _buildErrorWidget(dynamic error) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kHorPad, vertical: 20.0),
    child: Text(
      'Oops, movie list couldn\'t be loaded, check your internect connection.',
      textAlign: TextAlign.center,
      style: kFootnoteStyle.copyWith(
        color: kBlackColors[600],
      ),
    ),
  );
}

Widget _buildMoviesWidget(BuildContext context,
    {required MovieModel data, required Size size}) {
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
      height: isPhone() ? size.height * 0.744 : screenHeight(size) * 0.87,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          childAspectRatio: 0.67,
        ),
        scrollDirection: Axis.vertical,
        itemCount: movies.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(top: isPhone() ? 0.0 : 20.0, right: 16),
          child: MovieCardWidget(
            movie: movies[index],
            size: isPhone() ? size * 1.35 : size * 1.2,
            request: 'search',
          ),
        ),
      ),
    );
  }
}
