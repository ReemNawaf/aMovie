import 'package:hive/hive.dart';
part 'hive_movie_model.g.dart';

@HiveType(typeId: 0)
class HiveMovieModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final double rating;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String poster;
  @HiveField(5)
  final String overview;

  HiveMovieModel({
    required this.id,
    required this.rating,
    required this.title,
    required this.poster,
    required this.overview,
  });
}
