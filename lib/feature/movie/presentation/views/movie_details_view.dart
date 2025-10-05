import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_movie_details.dart';
import 'package:movies_app/feature/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_details_cubit/movie_details_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_details_cubit/movie_details_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/recommendations_movie_cubit/recommendation_movie_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_details_shimmer.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/realse_year_widget.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/similar_movie_grid_view.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<MovieDetailsCubit>()
                ..fetchMovieDetails(MovieDetailsParams(id: movieId)),
      child: Scaffold(
        backgroundColor: const Color(0xff1e1e29),
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const MovieDetailsShimmer();
            } else if (state is MovieDetailsFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is MovieDetailsSuccess) {
              final movieDetailsEntity = state.movieDetails;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${movieDetailsEntity.backdropPath}",
                      width: double.infinity,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            movieDetailsEntity.title,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              RealseYearWidget(
                                realseYear:
                                    movieDetailsEntity.releaseDate.isNotEmpty
                                        ? movieDetailsEntity.releaseDate
                                            .substring(0, 4)
                                        : "",
                                color: const Color(0xff303030),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.star, color: Colors.amber),
                              const SizedBox(width: 4),
                              Text(movieDetailsEntity.voteAverage.toString()),
                              const SizedBox(width: 30),
                              Text(
                                "${movieDetailsEntity.runtime ~/ 60} h ${movieDetailsEntity.runtime % 60} m",
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(movieDetailsEntity.overview),
                          Text(
                            "Genres: ${movieDetailsEntity.genres.map((g) => g.name).join(", ")}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "MORE LIKE THIS",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          BlocProvider(
                            create:
                                (context) =>
                                    sl<RecommendationMoviesCubit>()
                                      ..fetchRecommendationMovies(
                                        recommendationParams:
                                            RecommendationParams(movieId),
                                      ),
                            child: const MoviesGridView(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
