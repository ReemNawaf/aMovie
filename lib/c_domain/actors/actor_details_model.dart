class ActorDetailsModel {
  final ActorDetails? details;
  final String? error;

  ActorDetailsModel({this.details, this.error});

  factory ActorDetailsModel.fromJson(Map<String, dynamic> json) =>
      ActorDetailsModel(
        details: ActorDetails.fromJson(json),
        error: "",
      );

  factory ActorDetailsModel.withError(String error) => ActorDetailsModel(
        details: ActorDetails.empty(),
        error: error,
      );
}

class ActorDetails {
  int id;
  String name;
  List<String?> aka;
  String biography;
  int popularity;
  String profilePath;

  ActorDetails({
    required this.id,
    required this.name,
    required this.aka,
    required this.biography,
    required this.profilePath,
    required this.popularity,
  });
  factory ActorDetails.empty() => ActorDetails(
        id: 0,
        name: '',
        aka: [null, null, null],
        biography: '',
        profilePath: '',
        popularity: 0,
      );

  String get fullImgURL => 'https://image.tmdb.org/t/p/w500/$profilePath';

  factory ActorDetails.fromJson(Map<String, dynamic> json) => ActorDetails(
        id: json['id'],
        name: json['name'],
        aka: (json['also_known_as'] as List<dynamic>).map((e) => '$e').toList(),
        biography: json['biography'],
        popularity: 0,
        profilePath: json['profile_path'],
      );
}
