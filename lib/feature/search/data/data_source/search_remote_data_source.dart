import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/feature/movie/data/models/movie_model.dart';
import 'package:movies_app/feature/search/domain/use_cases/search_use_case.dart';

abstract class SearchRemoteDataSource {
  Future<List<MovieModel>> search({required SearchParams searchParams});
}

class SearchRemoteDataSourceImp extends SearchRemoteDataSource {
  ApiService apiService;
  SearchRemoteDataSourceImp(this.apiService);
  @override
  Future<List<MovieModel>> search({required SearchParams searchParams}) async {
    final response = await apiService.get(
      endPoint: 'search/movie',
      queryParameters: {'query': searchParams.title},
    );
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }
}
