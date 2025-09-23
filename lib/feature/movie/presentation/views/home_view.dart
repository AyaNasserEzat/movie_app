import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/feature/movie/data/repository/movie_reposyory_imp.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_to_rated_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/popular_movies_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/now_playing_movie_comonent.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/populare_movies_list_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/see_more_row.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/top_rated_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => PopularMovieCubit(
                GetPopularMoviesUseCase(
                  MovieReposyoryImp(
                    movieRemoteDataSource: MovieRemoteDataSourceImp(
                      ApiService(Dio()),
                    ),
                  ),
                ),
              )..fetchPopularMovies(),
        ),
        
        BlocProvider(
          create:
              (_) => TopRatedMoviesCubit(
                GetToRatedMoviesUseCase(
                  MovieReposyoryImp(
                    movieRemoteDataSource: MovieRemoteDataSourceImp(
                      ApiService(Dio()),
                    ),
                  ),
                ),
              )..fetchTopRatedMovies(),
        ),
        BlocProvider(
          create:
              (_) => NowPlayingMovieCubit(
                GetNowPlayingMoviesUseCase(
                  MovieReposyoryImp(
                    movieRemoteDataSource: MovieRemoteDataSourceImp(
                      ApiService(Dio()),
                    ),
                  ),
                ),
              )..fetchNowPlayingMovies(),
        ),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NowPlayingMovieComponent(),
              SeeMoreRow(
                text: "Popular",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PopularMoviesView();
                      },
                    ),
                  );
                },
              ),
              PopulareMovieListView(),
              SeeMoreRow(text: "Top Rated"),
              TopRatedListView(),
            ],
          ),
        ),
      ),
    );
  }
}
