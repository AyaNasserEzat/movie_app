import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<MovieEntity>>> search({required SearchParams searchParams});
}
