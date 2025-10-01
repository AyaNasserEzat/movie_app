import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/functions/app_bar.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item_shimmer_list_view.dart';

class TopRatedMoviesView extends StatelessWidget {
  const TopRatedMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff1e1e29),
      appBar: customAppBar(title: "Top Rated movies", context: context),
      body: BlocProvider(
        create:
            (context) => sl<TopRatedMoviesCubit>()..fetchTopRatedMovies(),

        child: BlocBuilder<TopRatedMoviesCubit, TopRatedMovieState>(
          builder: (context, state) {
            if (state is TopRatedMovieLoading) {
              return MovieItemShimmerListiew();
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