import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/seach_cubit.dart';
import 'package:movies_app/feature/search/presentation/manger/seach_cubit/search_state.dart';

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
                return GestureDetector(
                  onTap: () {
                    navigateTo(
                      context: context,
                      screen: MovieDetailsView(movieId: movie.id),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomMovieImage(
                        aspectRatio: 2.9 / 3.2,
                        borderRadius: 25,
                        imageUrl: movie.backdropPath,
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          movie.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }, childCount: movies.length),
            ),
          );
        } else if (state is SearchMovieFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text('حدث خطأ: ${state.errMessage}')),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('ابحث عن فيلم لعرض النتائج 🔍')),
          );
        }
      },
    );
  }
}
