import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/feature/movie/data/repository/movie_reposyory_imp.dart';
import 'package:movies_app/feature/movie/domain/repository/movie_repository.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_to_rated_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/recommendations_movie_cubit/recommendation_movie_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  // Dio
  sl.registerLazySingleton(() => Dio());

  // ApiService
  sl.registerLazySingleton(() => ApiService(sl()));

  // DataSource
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImp(sl()),
  );

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieReposyoryImp(movieRemoteDataSource: sl()),
  );

  // UseCase
  sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetToRatedMoviesUseCase((sl())));
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationMoviesUseCase((sl())));
  sl.registerLazySingleton(() => GetMovieDetailsUseCase((sl())));

  // Cubit
  sl.registerFactory(() => PopularMovieCubit(sl()));
  sl.registerFactory(() => TopRatedMoviesCubit(sl()));
  sl.registerFactory(() => NowPlayingMovieCubit(sl()));
  sl.registerFactory(() => MovieDetailsCubit(sl()));
  sl.registerFactory(() => RecommendationMoviesCubit(sl()));
}
