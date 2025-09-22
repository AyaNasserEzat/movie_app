import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEnitiy>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEnitiy>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEnitiy>>> getPopularMovies();
}
