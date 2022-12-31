import 'package:a_movie/a_presentation/movie_details_page/movie_details_page.dart';
import 'package:a_movie/a_presentation/saved_movies_page/widgets/list_movie_card.dart';
import 'package:a_movie/a_presentation/saved_movies_page/widgets/no_movies_in_list_wg.dart';
import 'package:a_movie/c_domain/movie/hive_movie_model.dart';
import 'package:a_movie/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteMoviesList extends StatefulWidget {
  const FavoriteMoviesList(this.size, {Key? key}) : super(key: key);
  final Size size;
  @override
  State<FavoriteMoviesList> createState() => FavoriteMoviesListState();
}

class FavoriteMoviesListState extends State<FavoriteMoviesList> {
  final favoriteMoviesList = Hive.box<HiveMovieModel>('movie_favorite_list');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return favoriteMoviesList.isEmpty
        ? const NoMoviesInListWidget()
        : SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: favoriteMoviesList.listenable(),
                  builder: (context, Box<HiveMovieModel> item, _) {
                    List<int> keys = item.keys.cast<int>().toList();

                    return SizedBox(
                      height: widget.size.height * 0.93,
                      child: ListView.builder(
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          final key = keys[index];
                          final HiveMovieModel? moveItem = item.get(key);
                          return ListMovieCard(
                            size: size,
                            onTap: () async {
                              final refresh = await Navigator.of(context)
                                  .push<bool>(
                                    MaterialPageRoute(
                                      builder: (_) => MoviesDetailsPage(
                                        id: moveItem.id,
                                      ),
                                    ),
                                  )
                                  .then((value) => value ?? true);

                              if (refresh) {
                                setState(() {});
                              }
                            },
                            title: moveItem!.title,
                            subtitle: moveItem.overview,
                            leading: '$imageURL${moveItem.poster}',
                            trailing: IconButton(
                              padding: const EdgeInsets.all(0),
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                favoriteMoviesList.deleteAt(index);
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
