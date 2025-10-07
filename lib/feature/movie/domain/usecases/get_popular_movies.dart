import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/core/use_cases/use_case.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';

class GetPopularMoviesUseCase extends UseCase<List<MovieEntity>, int> {
  final MovieRepository movieRepository;
  GetPopularMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEntity>>> call([int page = 1]) async {
    return await movieRepository.getPopularMovies(page: page);
  }
}
