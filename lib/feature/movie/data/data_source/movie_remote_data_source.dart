import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/feature/movie/data/models/movie_details_model.dart';
import 'package:movies_app/feature/movie/data/models/movie_model.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> gettPopularMovies();
  Future<MovieDetailsModel> getMovieDetails({
    required MovieDetailsParams movieDetailsParams,
  });
}

class MovieRemoteDataSourceImp extends MovieRemoteDataSource {
  ApiService apiService;
  MovieRemoteDataSourceImp(this.apiService);
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await apiService.get(endPoint: 'now_playing');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await apiService.get(endPoint: 'top_rated');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<List<MovieModel>> gettPopularMovies() async {
    final response = await apiService.get(endPoint: 'popular');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({
    required MovieDetailsParams movieDetailsParams,
  }) async {
    final response = await apiService.get(endPoint: movieDetailsParams.id.toString());
    return MovieDetailsModel.fromJson(response);
  }
}
