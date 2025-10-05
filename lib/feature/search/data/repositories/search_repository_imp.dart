import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/search/data/data_source/search_remote_data_source.dart';
import 'package:movies_app/feature/search/domain/repositories/search_repository.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';

class SearchRepositoryImp extends SearchRepository {
  SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImp(this.searchRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieEntity>>> search({
    required SearchParams searchParams,
  }) async {
    try {
      List<MovieEntity> movies = await searchRemoteDataSource.search(
        searchParams: searchParams,
      );
      return right(movies);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
