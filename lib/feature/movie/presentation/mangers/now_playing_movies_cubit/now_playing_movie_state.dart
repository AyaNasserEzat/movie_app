import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';

abstract class NowPlayingMovieState extends Equatable {
  const NowPlayingMovieState();

  @override
  List<Object?> get props => [];
}

class NowPlayingMovieInitial extends NowPlayingMovieState {}

class NowPlayingMovieLoading extends NowPlayingMovieState {}

class NowPlayingMovieSuccess extends NowPlayingMovieState {
  final List<MovieEntity> movies;

  const NowPlayingMovieSuccess(this.movies);

  @override
  List<Object?> get props => [movies];
}

class NowPlayingMovieFailure extends NowPlayingMovieState {
  final String message;

  const NowPlayingMovieFailure(this.message);

  @override
  List<Object?> get props => [message];
}
