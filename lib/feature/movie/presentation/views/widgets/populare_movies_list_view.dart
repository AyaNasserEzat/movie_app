import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/poulart_movies_state.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_image_shimmer_list_view.dart';

class PopulareMovieListView extends StatelessWidget {
  const PopulareMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        if (state is PopularMovieLoading) {
          return MovieImageShimmerListView();
        } else if (state is PopularMovieSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () {
                    navigateTo(
                      context: context,
                      screen: MovieDetailsView(movieId: movie.id),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: CustomMovieImage(imageUrl: movie.backdropPath),
                  ),
                );
              },
            ),
          );
        } else if (state is PopularMovieFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
