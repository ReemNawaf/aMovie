import 'package:a_movie/shared/app_colors.dart';
import 'package:a_movie/shared/measurements.dart';
import 'package:flutter/material.dart';
import 'package:a_movie/c_domain/genres/genres_model.dart';
import 'package:a_movie/a_presentation/genres_page/genre_movies.dart';

class GenreLists extends StatefulWidget {
  const GenreLists(
      {Key? key, required this.genres, required this.selectedGenreIndex})
      : super(key: key);
  final List<Genre> genres;
  final int selectedGenreIndex;

  @override
  State<GenreLists> createState() => _GenreListsState();
}

class _GenreListsState extends State<GenreLists>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: widget.selectedGenreIndex,
        length: widget.genres.length,
        vsync: this);
    _tabController!.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: widget.genres.length,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
            child: TabBar(
              controller: _tabController,
              indicatorColor: kPrimaryColors,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              unselectedLabelColor: kBlackColors[600],
              labelColor: kPrimaryColors,
              isScrollable: true,
              tabs: widget.genres.map((Genre genre) {
                return Container(
                  padding: EdgeInsets.only(
                    bottom: isPhone() ? 15 : 5.0,
                    top: 10,
                  ),
                  child: Text(
                    genre.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: isPhone() ? size.height * 0.83 : screenHeight(size) * 0.85,
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: widget.genres.map((Genre genre) {
                return GenreMovies(genreId: genre.id);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
