import 'package:a_movie/a_presentation/core/widgets/simple_app_bar.dart';
import 'package:a_movie/a_presentation/movie_details_page/page_builders.dart';
import 'package:a_movie/a_presentation/movie_details_page/widgets/movie_details_wg.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a_movie/b_application/movies_providers.dart';

class MoviesDetailsPage extends ConsumerWidget {
  const MoviesDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: kBackgroundDec,
        padding: EdgeInsets.only(top: size.height * 0.07),
        child: Column(
          children: [
            const SimpleAppBar(title: 'Movie Details'),
            FutureBuilder<MovieDetailsModel>(
              future: ref.read(movieRepoProvider).getAllMovieDetails(id),
              builder: (context, AsyncSnapshot<MovieDetailsModel> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.error != null &&
                      snapshot.data!.error!.isNotEmpty) {
                    return buildErrorWidget(snapshot.data!.error);
                  } else {
                    return SizedBox(
                      height: size.height * 0.878,
                      child: MovieDetailsWidget(
                        size: size,
                        movie: snapshot.data!,
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return buildErrorWidget(snapshot.error);
                } else {
                  return buildLoadingWidget();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
