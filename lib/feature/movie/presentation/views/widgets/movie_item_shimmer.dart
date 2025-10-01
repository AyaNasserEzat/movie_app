import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_container.dart';
import 'package:movies_app/core/widgets/custom_shimmer_movie_item.dart';

class MovieItemShimmer extends StatelessWidget {
  const MovieItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .23,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShimmerMovieImage(),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CustomShimmerContainer(width: 150, height: 12),
                  const SizedBox(height: 8),
                  CustomShimmerContainer(width: 100, height: 12),
                  const SizedBox(height: 14),
                  CustomShimmerContainer(width: double.infinity, height: 12),
                  const SizedBox(height: 5),
                  CustomShimmerContainer(width: double.infinity, height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
