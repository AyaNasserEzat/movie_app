import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/core/use_cases/use_case.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';

class GetRecommendationMoviesUseCase
    extends UseCase<List<MovieEntity>, RecommendationParams> {
  MovieRepository movieRepository;
  GetRecommendationMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call(
    RecommendationParams recommendationParams,
  ) async {
    return await movieRepository.getRecommendationMovies(
      recommendationParams: recommendationParams,
    );
  }
}

class RecommendationParams extends Equatable {
  final int id;
  const RecommendationParams(this.id);
  @override
  List<Object?> get props => [id];
}
