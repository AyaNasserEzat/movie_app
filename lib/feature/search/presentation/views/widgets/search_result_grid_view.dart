
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/functions/navigation.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';

class SearchResultGridView extends StatelessWidget {
  const SearchResultGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 5,
              childAspectRatio: 5 / 7,
            ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              navigateTo(
                context: context,
                screen: MovieDetailsView(movieId: 1175942),
              );
            },
            child: Column(
              children: [
                CustomMovieImage(
                  aspectRatio: 2.9 / 3.5,
                  borderRadius: 25,
                  imageUrl:
                      "https://image.tmdb.org/t/p/w500/lB96EMr5A7Og81UhyldJvvy35r.jpg",
                ),
                Text("bad guy22"),
              ],
            ),
          );
        },
      ),
    );
  }
}
