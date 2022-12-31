import 'package:a_movie/shared/constants.dart';

class ActorModel {
  final List<Actor> actors;
  final String? error;

  ActorModel({required this.actors, this.error});

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        actors:
            (json["cast"] as List).map((data) => Actor.fromJson(data)).toList(),
        error: "",
      );

  factory ActorModel.withError(String error) => ActorModel(
        actors: [],
        error: error,
      );
}

class Actor {
  int id;
  String? name;
  String? character;
  String? imagePath;

  Actor({
    required this.id,
    required this.name,
    required this.character,
    required this.imagePath,
  });

  //  From the image path get the movie poster
  String get fullImgURL => '$imageURL$imagePath';
  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      imagePath: json['profile_path'],
    );
  }
}

List<String> getGenresFromID(List<int> genresIDs) =>
    genresIDs.map((id) => '').toList();
