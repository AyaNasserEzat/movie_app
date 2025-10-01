
import 'package:flutter/material.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/movie_item_shimmer.dart';

class MovieItemShimmerListiew extends StatelessWidget {
  const MovieItemShimmerListiew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: const MovieItemShimmer(),
          ),
    );
  }
}
