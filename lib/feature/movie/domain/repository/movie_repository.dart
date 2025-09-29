import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_details_entity.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_recommendation_movies.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies();
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({required MovieDetailsParams movieDetailsParams});
 Future<Either<Failure, List<MovieEntity>>> getRecommendationMovies({required RecommendationParams recommendationParams});
}
