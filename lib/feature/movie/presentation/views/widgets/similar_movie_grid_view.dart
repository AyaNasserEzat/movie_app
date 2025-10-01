import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/presentation/mangers/recommendations_movie_cubit/recommendation_movie_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/recommendations_movie_cubit/recommendation_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationMoviesCubit, RecommendationMovieState>(
      builder: (context, state) {
        if (state is RecommendationMovieLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecommendationMovieFailure) {
          return Center(child: Text(state.message));
        } else if (state is RecommendationMovieSuccess) {
          return GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.movies.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 12 / 18,
            ),
            itemBuilder: (context, index) {
              final movie = state.movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) =>  MovieDetailsView(movieId: movie.id,)),
                   );
                },
                child: CustomMovieImage(
                  borderRadius: 5,
                  imageUrl: "https://image.tmdb.org/t/p/w500${movie.backdropPath}", 
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink(); 
        }
      },
    );
  }
}
