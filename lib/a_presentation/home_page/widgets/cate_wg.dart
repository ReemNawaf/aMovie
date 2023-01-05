import 'package:a_movie/a_presentation/genres_page/genres_page.dart';
import 'package:a_movie/c_domain/genres/genres_model.dart';
import 'package:a_movie/b_application/movies_providers.dart';
import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:a_movie/shared/strings.dart';
import 'package:a_movie/shared/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPad),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.category,
                style: kCalloutStyle,
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, GenresPage.route),
                child: Row(
                  children: [
                    Text(
                      AppStrings.seeAll,
                      style: kFootnoteStyle.copyWith(
                          color: kPrimaryColors, fontWeight: FontWeight.w700),
                    ),
                    const Icon(Icons.keyboard_arrow_right_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
        FutureBuilder(
          future: ref.read(movieRepoProvider).getGenres(),
          builder: (context, AsyncSnapshot<GenreModel> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.error != null &&
                  snapshot.data!.error!.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kHorPad),
                  child: Text(
                    'Oops, genres list couldn\'t be, check your internect connection.',
                    textAlign: TextAlign.center,
                    style: kFootnoteStyle.copyWith(
                      color: kBlackColors[600],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height:
                      isPhone() ? size.height * 0.1 : screenHeight(size) * 0.14,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: kMovieCategoryList.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenresPage(
                            selectedGenreIndex: index,
                          ),
                        ),
                      ),
                      child: categoryItem(
                        label: snapshot.data!.genres![index].name,
                        emoji: kMovieCategoryList[
                                snapshot.data!.genres![index].name] ??
                            '',
                      ),
                    ),
                  ),
                );
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

Widget categoryItem({required String label, required String emoji}) => Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16.0),
          padding: const EdgeInsets.only(
              top: 12.0, bottom: 12.0, left: 18.0, right: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: kBlackColors[500],
          ),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 35.0),
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: kCaption2Style,
        )
      ],
    );
