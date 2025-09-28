import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/genres_entity.dart';

class MovieDetailsEntity extends Equatable {
  final String backdropPath;
  final int id;
  final List<GenresEntity> genres;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  const MovieDetailsEntity({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
    backdropPath,
    genres,
    id,
    overview,
    releaseDate,
    runtime,
    title,
    voteAverage,
  ];
}
