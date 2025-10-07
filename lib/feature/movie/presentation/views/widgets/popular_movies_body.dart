import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/poulart_movies_state.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item_shimmer_list_view.dart';

class PopularMoviesBody extends StatefulWidget {
  const PopularMoviesBody({super.key});

  @override
  State<PopularMoviesBody> createState() => _PopularMoviesBodyState();
}

class _PopularMoviesBodyState extends State<PopularMoviesBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final cubit = context.read<PopularMovieCubit>();
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.fetchPopularMovies(isLoadMore: true);
      }
    });
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMovieCubit, PopularMovieState>(
      builder: (context, state) {
        final cubit = context.read<PopularMovieCubit>();
        if (state is PopularMovieLoading && cubit.currentPage == 1) {
          return const MovieItemShimmerListiew();
        } else if (state is PopularMovieFailure) {
          return Center(child: Text(state.message));
        } else if (state is PopularMovieSuccess) {
          final movies = state.movies;
          final cubit = context.read<PopularMovieCubit>();
          return ListView.builder(
            controller: _scrollController,
            itemCount: movies.length + (cubit.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < movies.length) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieItem(movieEntity: movies[index]),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2,color: Colors.red,),
                  ),
                );
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
