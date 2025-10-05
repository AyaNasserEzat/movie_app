import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/functions/app_bar.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/poulart_movies_state.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item_shimmer_list_view.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff1e1e29),
      appBar: customAppBar(title: "Popular movies", context: context),
      body: BlocProvider(
        create: (context) => sl<PopularMovieCubit>()..fetchPopularMovies(),

        child: BlocBuilder<PopularMovieCubit, PopularMovieState>(
          builder: (context, state) {
            if (state is PopularMovieLoading) {
              return MovieItemShimmerListiew();
            } else if (state is PopularMovieSuccess) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MovieItem(movieEntity: state.movies[index]),
                  );
                },
              );
            } else if (state is PopularMovieFailure) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
