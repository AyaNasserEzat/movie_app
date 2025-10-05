import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/seach_cubit.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/search_state.dart';
import 'package:movies_app/feature/search/presentation/views/widgets/search_result_item.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchMovieLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is SearchMovieSuccess) {
          final movies = state.movies;

          return SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 5,
                childAspectRatio: 5 / 7,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final movie = movies[index];
                return SearchResultItem(movie: movie);
              }, childCount: movies.length),
            ),
          );
        } else if (state is SearchMovieFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text('${state.errMessage}')),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Search for a movie to display results🔍')),
          );
        }
      },
    );
  }
}
