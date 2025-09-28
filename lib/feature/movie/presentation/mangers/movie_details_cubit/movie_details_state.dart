import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_details_entity.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsEntity movieDetails;

  const MovieDetailsSuccess(this.movieDetails);

  @override
  List<Object?> get props => [movieDetails];
}

class MovieDetailsFailure extends MovieDetailsState {
  final String message;

  const MovieDetailsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
