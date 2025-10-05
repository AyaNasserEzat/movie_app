import 'package:equatable/equatable.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
abstract class SearchState extends Equatable {
  const SearchState();
  @override
  List<Object> get props => [];
}

class SearchMovieInitial extends SearchState {}

class SearchMovieLoading extends SearchState {}

class SearchMovieFailure extends SearchState {
  final String errMessage;
  const SearchMovieFailure(this.errMessage);
}

class SearchMovieSuccess extends SearchState {
  final List<MovieEntity> movies;
  const SearchMovieSuccess(this.movies);
}