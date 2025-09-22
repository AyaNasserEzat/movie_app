import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_cubit/movie_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/movie_cubit/movie_state.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';

class PopulareMovieListView extends StatelessWidget {
  const PopulareMovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading ) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieSuccess 
          ) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .22,
            child: ListView.builder(
              itemCount: state.movies.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const MovieDetailsView();
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 2.6 / 4,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is MovieFailure 
            ) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
