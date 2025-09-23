import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';

abstract class TopRatedMovieState extends Equatable {
  const TopRatedMovieState();

  @override
  List<Object?> get props => [];
}

class TopRatedMovieInitial extends TopRatedMovieState {}

class TopRatedMovieLoading extends TopRatedMovieState {}

class TopRatedMovieSuccess extends TopRatedMovieState {
  final List<MovieEntity> movies;

  const TopRatedMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TopRatedMovieFailure extends TopRatedMovieState {
  final String message;

  const TopRatedMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
