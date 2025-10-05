
import 'package:flutter/material.dart';

class SearchForMovieText extends StatelessWidget {
  const SearchForMovieText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: 300),
          Text('Search for a movie to display results🔍'),
        ],
      ),
    );
  }
}
