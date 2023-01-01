import 'package:a_movie/c_domain/actors/actor_details_model.dart';
import 'package:a_movie/environment_config.dart';
import 'package:dio/dio.dart';

class ActorRepo {
  ActorRepo(this._environmentConfig, this.dio);
  final EnvironmentConfig _environmentConfig;
  final Dio dio;
  static String mainUrl = "https://api.themoviedb.org/3";
  static String getActorUrl = "$mainUrl/person";

  Future<ActorDetailsModel> getActorDetails(int id) async {
    var params = {
      "api_key": _environmentConfig.movieAPIKey,
      "language": "en-us"
    };
    try {
      Response response =
          await dio.get('$getActorUrl/$id', queryParameters: params);
      return ActorDetailsModel.fromJson(response.data);
    } catch (error) {
      return ActorDetailsModel.withError("$error");
    }
  }
}
