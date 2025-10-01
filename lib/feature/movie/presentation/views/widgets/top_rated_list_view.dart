import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_image_shimmer_list_view.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMoviesCubit, TopRatedMovieState>(
      builder: (context, state) {
        if (state is TopRatedMovieLoading) {
          return MovieImageShimmerListView();
        } else if (state is TopRatedMovieSuccess) {
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 2.8 / 4,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is TopRatedMovieFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
