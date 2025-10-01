import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_movie_item.dart';

class MovieImageShimmerListView extends StatelessWidget {
  const MovieImageShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CustomShimmerMovieImage(),
            ),
      ),
    );
  }
}
