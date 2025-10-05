import 'package:flutter/material.dart';
import 'package:movies_app/feature/search/presentation/views/widgets/shimmer_search_result_item.dart';

class ShimmerSearchResultGridView extends StatelessWidget {
  const ShimmerSearchResultGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 5,
          childAspectRatio: 5 / 7,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => const MovieShimmerItem(),
          childCount: 8,
        ),
      ),
    );
  }
}
