import 'package:movies_app/feature/movie/data/models/genres_model.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_details_entity.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'] ?? "",
      id: json['id'],
      title: json['title'] ?? "",
      overview: json['overview'] ?? "",
      releaseDate: json['release_date'] ?? "",
      runtime: json['runtime'] ?? 0,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      genres:
          (json['genres'] as List<dynamic>?)
              ?.map((e) => GenresModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
