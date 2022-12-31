import 'package:a_movie/shared/constants.dart';

class MovieModel {
  final List<Movie>? movies;
  final String? error;

  MovieModel({this.movies, this.error});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        movies: (json["results"] as List)
            .map((data) => Movie.fromJson(data))
            .toList(),
        error: "",
      );

  factory MovieModel.withError(String error) => MovieModel(
        error: error,
      );
}

class Movie {
  int? id;
  double? rating;
  String? title;
  String? backDrop;
  String? poster;
  String? overview;
  List<int> genre;

  Movie({
    this.id,
    this.rating,
    this.title,
    this.backDrop,
    this.poster,
    this.overview,
    required this.genre,
  });

  //  From the image path get the movie poster
  String get fullImgURL => '$imageURL$poster';

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        rating: json['vote_average'].toDouble(),
        title: json['title'],
        backDrop: json['backdrop_path'],
        poster: json['poster_path'],
        overview: json['overview'],
        genre: (json['genre_ids'] as List<dynamic>)
            .map((e) => int.parse('$e'))
            .toList());
  }

  factory Movie.empty() {
    return Movie(
      id: 0,
      rating: 0,
      title: '',
      backDrop: '',
      poster: '',
      overview: '',
      genre: [],
    );
  }
}

List<String> getGenresFromID(List<int> genresIDs) =>
    genresIDs.map((id) => '').toList();
