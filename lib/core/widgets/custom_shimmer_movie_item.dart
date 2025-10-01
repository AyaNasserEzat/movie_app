
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerMovieImage extends StatelessWidget {
  const CustomShimmerMovieImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
