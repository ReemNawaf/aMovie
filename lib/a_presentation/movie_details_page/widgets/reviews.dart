import 'package:a_movie/a_presentation/movie_details_page/widgets/review_card.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:a_movie/c_domain/reviews_model.dart';

class Reviews extends ConsumerWidget {
  const Reviews({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 26.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Reviews',
              style: kSubheadStyle.copyWith(color: kBlackColors[600]),
            ),
          ),
          const SizedBox(height: 10.0),
          FutureBuilder<ReviewsModel>(
            future: ref.read(movieRepoProvider).getReviews(id),
            builder: (context, AsyncSnapshot<ReviewsModel> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.error != null &&
                    snapshot.data!.error!.isNotEmpty) {
                  return _buildErrorWidget(snapshot.data!.error);
                }
                return _buildReviewsWidget(size: size, data: snapshot.data!);
              } else if (snapshot.hasError) {
                return _buildErrorWidget(snapshot.error);
              } else {
                return _buildLoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            width: 25.0,
            height: 25.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 4.0,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorWidget(dynamic error) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorPad),
      child: Text(
        'Oops, movie reviews couldn\'t be loaded, check your internect connection.',
        textAlign: TextAlign.center,
        style: kFootnoteStyle.copyWith(
          color: kBlackColors[600],
        ),
      ),
    );
    ;
  }

  Widget _buildReviewsWidget({required Size size, required ReviewsModel data}) {
    List<Review>? reviews = data.reviews;
    if (reviews!.isEmpty) {
      return const SizedBox(
        child: Center(
          child: Text(
            'There is no reviews shown',
            style: kCaption1Style,
          ),
        ),
      );
    } else {
      return Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Row(
            children: [
              Text(
                'Number of Reviews:  ',
                style: kFootnoteStyle.copyWith(
                    fontSize: 13.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10.0),
              Text(
                reviews.length.toString(),
                style: kFootnoteStyle.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w900,
                    color: kPrimaryColors),
              ),
            ],
          ),
        ),
        ...List.generate(reviews.length, (index) {
          return ReviewCard(
              title: reviews[index].author ?? '',
              subtitle: reviews[index].content ?? '',
              size: size);
        }),
      ]);
    }
  }
}
