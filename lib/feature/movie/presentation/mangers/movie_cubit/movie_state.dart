import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieEntity> movies;

  const MovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieFailure extends MovieState {
  final String message;

  const MovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
