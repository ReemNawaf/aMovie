import 'package:a_movie/c_domain/actors/actor_model.dart';
import 'package:a_movie/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:a_movie/c_domain/genres/genres_model.dart';
import 'package:a_movie/c_domain/movie/movie_details_model.dart';
import 'package:a_movie/c_domain/movie/movie_model.dart';
import 'package:a_movie/c_domain/reviews_model.dart';
import 'package:a_movie/c_domain/trailers_model.dart';

//  get Now Playing Movies
//  get Up cominging Movies
//  get all Movies
//  get filtered Movies
//  get Actor Movies
//  get favorite Movies
//  get Movies Info
//  get trending Movies
//  add favorite Movies
//  delete favorite Movies
//  set as seen favorite Movies
//  return back as unseen favorite Movies

class MovieRepo {
  MovieRepo(this._environmentConfig, this.dio);
  final EnvironmentConfig _environmentConfig;
  final Dio dio;
  static String mainUrl = "https://api.themoviedb.org/3";
  static String getGenreUrl = "$mainUrl/genre";
  static String getDiscoverUrl = "$mainUrl/discover";
  static String getMoviesUrl = "$mainUrl/movie";

  Future<GenreModel> getGenres() async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us",
      "page": 1
    };

    try {
      Response response =
          await dio.get("$getGenreUrl/movie/list", queryParameters: params);
      return GenreModel.fromJson(response.data);
    } catch (error) {
      return GenreModel.withError("$error");
    }
  }

  Future<ReviewsModel> getReviews(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us",
      "page": 1
    };

    try {
      Response response =
          await dio.get("$mainUrl/movie/$id/reviews", queryParameters: params);
      return ReviewsModel.fromJson(response.data);
    } catch (error) {
      return ReviewsModel.withError("$error");
    }
  }

  Future<TrailersModel> getTrailers(String shows, int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };

    try {
      Response response =
          await dio.get("$mainUrl/$shows/$id/videos", queryParameters: params);
      return TrailersModel.fromJson(response.data);
    } catch (error) {
      return TrailersModel.withError("$error");
    }
  }

  Future<MovieModel> getSimilarMovies(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us",
      "page": 1
    };

    try {
      Response response =
          await dio.get("$getMoviesUrl/$id/similar", queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

  Future<MovieModel> getDiscoverMovies(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us",
      "page": 1,
      "with_genres": id,
    };

    try {
      Response response =
          await dio.get("$getDiscoverUrl/movie", queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

  Future<MovieDetailsModel> getMovieDetails(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };

    try {
      Response response =
          await dio.get("$getMoviesUrl/$id", queryParameters: params);

      return MovieDetailsModel.fromJson(response.data);
    } catch (error) {
      return MovieDetailsModel.withError("$error");
    }
  }

  Future<MovieDetailsModel> getAllMovieDetails(int id) async {
    try {
      final movieModel = await getMovieDetails(id);
      final movieCast = await getMoviesCast(id);

      movieModel.details!.setMovieCast(movieCast.actors);
      return movieModel;
    } catch (error) {
      return MovieDetailsModel.withError("$error");
    }
  }

  //  =============================| getMovies |=============================
  Future<MovieModel> getMovies(String request) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };

    try {
      Response response =
          await dio.get("$getMoviesUrl/$request", queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

  Future<MovieModel> getTrendingMovies(String timeFrame) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };

    try {
      Response response = await dio.get('$mainUrl/trending/movie/$timeFrame',
          queryParameters: params);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

  Future<ActorModel> getMoviesCast(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };

    try {
      Response response =
          await dio.get("$getMoviesUrl/$id/credits", queryParameters: params);

      return ActorModel.fromJson(response.data);
    } catch (error) {
      return ActorModel.withError("$error");
    }
  }

  Future<MovieModel> searchMovies(String searchTerm) async {
    var params = {
      'api_key': _environmentConfig.movieAPIKey,
      'language': 'en-us',
      'query': searchTerm
    };
    try {
      Response response =
          await dio.get('$mainUrl/search/movie/', queryParameters: params);

      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("$error");
    }
  }

  Future<List<String>> genreIdToName(List<int> movieIdes) async {
    final genresModel = await getGenres();

    List<Genre> genres = genresModel.genres!.where((genre) {
      for (int id in movieIdes) {
        if (id == genre.id) {
          return true;
        }
      }
      return false;
    }).toList();

    final movieGenresString = genres.map((gen) => gen.name).toList();
    return movieGenresString;
  }
}
