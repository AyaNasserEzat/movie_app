import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movies_cubit.dart';

class NowPlayingMovieComponent extends StatelessWidget {
  const NowPlayingMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieLoading) {
          return const SizedBox(
            height: 350,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is NowPlayingMovieSuccess) {
          final movie = state.movies.isNotEmpty ? state.movies.first : null;
          if (movie == null) {
            return const SizedBox(
              height: 350,
              child: Center(child: Text("No movies available")),
            );
          }
          return SizedBox(
            height: 350,
            child: Stack(
              children: [
                // صورة الفيلم
                Image.network(
                  "https://image.tmdb.org/t/p/w500${movie.backdropPath ?? movie.posterPath}",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                // الجريدينت
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.grey.shade900, Colors.transparent],
                    ),
                  ),
                ),
                // Now Playing + اسم الفيلم
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Now Playing",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        movie.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is NowPlayingMovieFailure) {
          return SizedBox(
            height: 350,
            child: Center(child: Text(state.message)),
          );
        }
        return const SizedBox(
          height: 350,
          child: Center(child: Text("No data")),
        );
      },
    );
  }
}
