import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_container.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/grid_view_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsShimmer extends StatelessWidget {
  const MovieDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الفيلم
          Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              width: double.infinity,
              height: 320,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmerContainer(width: 220, height: 28),
                const SizedBox(height: 10),

                Row(
                  children: [
                    CustomShimmerContainer(width: 50, height: 16),
                    const SizedBox(width: 20),
                    CustomShimmerContainer(width: 40, height: 16),
                    const SizedBox(width: 20),
                    CustomShimmerContainer(width: 60, height: 16),
                  ],
                ),
                const SizedBox(height: 15),

                CustomShimmerContainer(width: double.infinity, height: 14),
                const SizedBox(height: 12),
                CustomShimmerContainer(width: double.infinity, height: 14),
                const SizedBox(height: 12),

                CustomShimmerContainer(width: 180, height: 14),
                const SizedBox(height: 15),
                const Text("MORE LIKE THIS", style: TextStyle(fontSize: 18)),
                 const SizedBox(height: 15),
                GridViewShimmer()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
