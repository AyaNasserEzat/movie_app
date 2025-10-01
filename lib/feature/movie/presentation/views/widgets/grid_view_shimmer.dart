import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_movie_item.dart';

class GridViewShimmer extends StatelessWidget {
  const GridViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
            padding: EdgeInsets.zero,
            itemCount:20,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 12 / 18,
            ),
            itemBuilder: (context, index) {
              return CustomShimmerMovieImage();
            },
          );
  }
}