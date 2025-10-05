import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/fauiler.dart';
import 'package:movies_app/core/use_cases/use_case.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/search/domain/repositories/search_repository.dart';

class SearchUseCase extends UseCase<List<MovieEntity>, SearchParams> {
  SearchRepository searchRepository;
  SearchUseCase(this.searchRepository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(SearchParams param) async {
    return await searchRepository.search(searchParams: param);
  }
}

class SearchParams extends Equatable {
  final String title;
  const SearchParams(this.title);
  @override
  List<Object?> get props => [title];
}
