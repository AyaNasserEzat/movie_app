import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
