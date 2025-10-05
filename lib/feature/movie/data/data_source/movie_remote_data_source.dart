import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/feature/movie/data/models/movie_details_model.dart';
import 'package:movies_app/feature/movie/data/models/movie_model.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_recommendation_movies.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> gettPopularMovies();
  Future<MovieDetailsModel> getMovieDetails({
    required MovieDetailsParams movieDetailsParams,
  });
  Future<List<MovieModel>> getRecommendationMovies({
    required RecommendationParams recommendationParams,
  });
}

class MovieRemoteDataSourceImp extends MovieRemoteDataSource {
  ApiService apiService;
  MovieRemoteDataSourceImp(this.apiService);
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await apiService.get(endPoint: 'movie/now_playing');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await apiService.get(endPoint: 'movie/top_rated');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<List<MovieModel>> gettPopularMovies() async {
    final response = await apiService.get(endPoint: 'movie/popular');
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }

  @override
  Future<MovieDetailsModel> getMovieDetails({
    required MovieDetailsParams movieDetailsParams,
  }) async {
    final response = await apiService.get(
      endPoint: movieDetailsParams.id.toString(),
    );
    return MovieDetailsModel.fromJson(response);
  }

  @override
  Future<List<MovieModel>> getRecommendationMovies({
    required RecommendationParams recommendationParams,
  }) async {
    final response = await apiService.get(
      endPoint: 'movie/${recommendationParams.id.toString()}/recommendations',
    );
    return List<MovieModel>.from(
      (response["results"] as List).map((e) => MovieModel.fromJson(e)),
    );
  }
}
