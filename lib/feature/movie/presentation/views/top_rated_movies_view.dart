import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/functions/api_service.dart';
import 'package:movies_app/core/utils/functions/app_bar.dart';
import 'package:movies_app/feature/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/feature/movie/data/repository/movie_reposyory_imp.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_to_rated_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item.dart';

class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff1e1e29),
      appBar: customAppBar(title: "Top Rated movies"),
      body: BlocProvider(
        create:
            (context) => TopRatedMoviesCubit(
              GetToRatedMoviesUseCase(
                MovieReposyoryImp(
                  movieRemoteDataSource: MovieRemoteDataSourceImp(
                    ApiService(Dio()),
                  ),
                ),
              ),
            )..fetchTopRatedMovies(),

        child: BlocBuilder<TopRatedMoviesCubit, TopRatedMovieState>(
          builder: (context, state) {
            if (state is TopRatedMovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopRatedMovieSuccess) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MovieItem(movieEntity: state.movies[index]),
                    );
                  },
                ),
              );
            } else if (state is TopRatedMovieFailure) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}