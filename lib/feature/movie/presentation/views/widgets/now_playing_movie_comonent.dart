import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movie_state.dart';
import 'package:movies_app/feature/movie/presentation/mangers/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingMovieComponent extends StatelessWidget {
  const NowPlayingMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieCubit, NowPlayingMovieState>(
      builder: (context, state) {
        if (state is NowPlayingMovieLoading) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              width: double.infinity,
              height: 320,
              color: Colors.grey,
            ),
          );
        } else if (state is NowPlayingMovieSuccess) {
          final movie = state.movies.isNotEmpty ? state.movies : null;
          if (movie == null) {
            return const SizedBox(
              height: 350,
              child: Center(child: Text("No movies available")),
            );
          }
          return CarouselSlider(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              viewportFraction: 1.0,

              scrollDirection: Axis.horizontal,
            ),
            items:
                state.movies.map((e) {
                  return SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        // صورة الفيلم
                        CachedNetworkImage(
                          imageUrl:
                              "https://image.tmdb.org/t/p/w500${e.backdropPath}",
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
                              colors: [
                                Colors.grey.shade900,
                                Colors.transparent,
                              ],
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
                                      textAlign: TextAlign.center,
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
                                e.title,
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
                }).toList(),
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
