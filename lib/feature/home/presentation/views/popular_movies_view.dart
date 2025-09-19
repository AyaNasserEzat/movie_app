import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/popuar_moie_item.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e29),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PopularMovieItem(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
