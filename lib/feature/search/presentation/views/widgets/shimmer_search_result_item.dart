import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/custom_shimmer_container.dart';

class MovieShimmerItem extends StatelessWidget {
  const MovieShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomShimmerContainer(height: 180, width: double.infinity),
        const SizedBox(height: 8),
        CustomShimmerContainer(height: 14, width: 80),
      ],
    );
  }
}
