import 'package:flutter/material.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
       padding: EdgeInsets.zero,
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 12 / 18,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (_) => const MovieDetailsView()),
            // );
          },
          child: CustomMovieImage(borderRadius: 5),
        );
      },
    );
  }
}
