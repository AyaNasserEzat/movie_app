import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/popular_movies_view.dart';
import 'package:movies_app/feature/movie/presentation/views/top_rated_movies_view.dart';
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
          create: (_) => sl<PopularMovieCubit>()..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (_) => sl<TopRatedMoviesCubit>()..fetchTopRatedMovies(),
        ),
        BlocProvider(
          create: (_) => sl<NowPlayingMovieCubit>()..fetchNowPlayingMovies(),
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
                  navigateTo(context: context, screen: PopularMoviesView());
                },
              ),
              PopulareMovieListView(),
              SeeMoreRow(
                text: "Top Rated",
                onTap: () {
                  navigateTo(context: context, screen: TopRatedMoviesView());
                },
              ),
              TopRatedListView(),
            ],
          ),
        ),
      ),
    );
  }
}
