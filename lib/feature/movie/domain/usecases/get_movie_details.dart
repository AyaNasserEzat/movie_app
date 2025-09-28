import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/core/use_cases/use_case.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_details_entity.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';

class GetMovieDetailsUseCase
    extends UseCase<MovieDetailsEntity, MovieDetailsParams> {
  final MovieRepository movieRepository;
  GetMovieDetailsUseCase(this.movieRepository);
  @override
  Future<Either<Failure, MovieDetailsEntity>> call(
    MovieDetailsParams movieDetailsParams,
  ) async {
    return await movieRepository.getMovieDetails(
      movieDetailsParams: movieDetailsParams,
    );
  }
}

class MovieDetailsParams extends Equatable {
  final int id;

  const MovieDetailsParams({required this.id});

  @override
  List<Object?> get props => [id];
}
