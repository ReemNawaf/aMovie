import 'package:a_movie/a_presentation/core/widgets/simple_app_bar.dart';
import 'package:a_movie/a_presentation/home_page/widgets/movie_card_skeleton_wg.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/c_domain/genres/genres_model.dart';
import 'package:a_movie/a_presentation/genres_page/genres_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresPage extends ConsumerWidget {
  static const String route = 'genres_page';
  const GenresPage({Key? key, this.selectedGenreIndex = 0}) : super(key: key);
  final int selectedGenreIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        decoration: kBackgroundDec,
        child: Column(
          children: [
            const SimpleAppBar(title: 'Explore Movies By Genres'),
            FutureBuilder<GenreModel>(
              future: ref.read(movieRepoProvider).getGenres(),
              builder: (context, AsyncSnapshot<GenreModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.isNotEmpty) {
                    return _buildErrorWidget(snapshot.data!.error);
                  } else {
                    return _buildGetGenresWidget(
                        data: snapshot.data!,
                        selectedGenreIndex: selectedGenreIndex);
                  }
                } else if (snapshot.hasError) {
                  return _buildErrorWidget(snapshot.error);
                } else {
                  return _buildLoadingWidget(size);
                }
              },
            ),
          ],
        ),
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: kHorPad),
      child: Text(
        'Oops, movies couldn\'t be, check your internect connection.',
        textAlign: TextAlign.center,
        style: kFootnoteStyle.copyWith(
          color: kBlackColors[600],
        ),
      ),
    );
  }

  Widget _buildGetGenresWidget(
      {required GenreModel data, required int selectedGenreIndex}) {
    List<Genre>? genres = data.genres;
    if (genres!.isEmpty) {
      return const SizedBox(
        child: Text(
          'No Genres',
          style: TextStyle(
            fontSize: 20,
            color: kBlackColors,
          ),
        ),
      );
    } else {
      return GenreLists(selectedGenreIndex: selectedGenreIndex, genres: genres);
    }
  }
}
