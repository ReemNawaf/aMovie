import 'package:a_movie/c_domain/movie/movie_model.dart';
import 'package:a_movie/d_infrastructure/actors_repo.dart';
import 'package:a_movie/d_infrastructure/movies_repo.dart';
import 'package:a_movie/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepoProvider = Provider<MovieRepo>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieRepo(config, Dio());
});

final actorRepoProvider = Provider<ActorRepo>((ref) {
  final config = ref.read(environmentConfigProvider);
  return ActorRepo(config, Dio());
});

final upcomingMoviesProvider =
    FutureProvider.autoDispose<MovieModel>((ref) async {
  ref.keepAlive();
  final movieRepo = ref.read(movieRepoProvider);
  final upcomingMovies = await movieRepo.getMovies('upcoming');
  return upcomingMovies;
});

final topRatedMoviesProvider =
    FutureProvider.autoDispose<MovieModel>((ref) async {
  ref.keepAlive();
  final movieRepo = ref.read(movieRepoProvider);
  final upcomingMovies = await movieRepo.getMovies('topRated');
  return upcomingMovies;
});

final popularMoviesProvider =
    FutureProvider.autoDispose<MovieModel>((ref) async {
  ref.keepAlive();
  final movieRepo = ref.read(movieRepoProvider);
  final upcomingMovies = await movieRepo.getMovies('popular');
  return upcomingMovies;
});
