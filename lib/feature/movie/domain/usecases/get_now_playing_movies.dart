import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/core/use_cases/use_case.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';

class GetNowPlayingMoviesUseCase extends UseCase<List<MovieEnitiy>,NoParam> {
 final MovieRepository movieRepository;
  GetNowPlayingMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<MovieEnitiy>>> call([NoParam? param]) async{
   return await movieRepository.getNowPlayingMovies();
  }
}