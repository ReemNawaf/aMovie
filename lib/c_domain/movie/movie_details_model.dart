import 'package:a_movie/c_domain/actors/actor_model.dart';
import 'package:a_movie/c_domain/genres/genres_model.dart';

class MovieDetailsModel {
  final MovieDetails? details;
  final String? error;

  MovieDetailsModel({this.details, this.error});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        details: MovieDetails.fromJson(json),
        error: "",
      );

  factory MovieDetailsModel.withError(String error) => MovieDetailsModel(
        details: MovieDetails.empty(),
        error: error,
      );
}

class MovieDetails {
  int id;
  List<Genre> genres;
  String releaseDate;
  String overview;
  String backDrop;
  String poster;
  double rating;
  String title;
  int runtime;
  List<Actor> cast;

  MovieDetails(
      {required this.id,
      required this.genres,
      required this.releaseDate,
      required this.overview,
      required this.backDrop,
      required this.poster,
      required this.rating,
      required this.title,
      required this.runtime,
      required this.cast});
  factory MovieDetails.empty() => MovieDetails(
      id: 0,
      genres: [],
      releaseDate: '',
      overview: '',
      backDrop: '',
      poster: '',
      rating: 0,
      title: '',
      runtime: 0,
      cast: []);

  String get fullImgURL => 'https://image.tmdb.org/t/p/w500/$poster';

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        id: json['id'],
        genres: (json['genres'] as List)
            .map((genre) => Genre.fromJson(genre))
            .toList(),
        rating: json['vote_average'].toDouble(),
        title: json['title'],
        backDrop: json['backdrop_path'],
        poster: json['poster_path'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        cast: [],
      );

  void setMovieCast(List<Actor> movieCast) {
    cast = movieCast;
  }
}
