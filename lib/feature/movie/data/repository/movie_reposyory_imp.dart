import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';

class MovieReposyoryImp extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;
  MovieReposyoryImp({required this.movieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies() async {
    try {
      List<MovieEntity> movies =
          await movieRemoteDataSource.getNowPlayingMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      List<MovieEntity> movies =
          await movieRemoteDataSource.gettPopularMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies() async {
    try {
      List<MovieEntity> movies =
          await movieRemoteDataSource.getTopRatedMovies();
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
