class TrailersModel {
  final List<Video>? trailers;
  final String? error;

  TrailersModel({this.trailers, this.error});

  factory TrailersModel.fromJson(Map<String, dynamic> json) => TrailersModel(
        trailers: (json["results"] as List)
            .map((data) => Video.fromJson(data))
            .toList(),
        error: "",
      );

  factory TrailersModel.withError(String error) => TrailersModel(
        trailers: [],
        error: error,
      );
}

class Video {
  String? id;
  String? key;
  String? name;
  String? site;
  String? type;

  Video({this.id, this.key, this.name, this.site, this.type});

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'],
        key: json['key'],
        name: json['name'],
        site: json['site'],
        type: json['type'],
      );
}
