import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/now_playing_movie_comonent.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/populare_movies_list_view.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/see_more_row.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/top_rated_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NowPlayingMovieComponent(),
            SeeMoreRow(text: "Popular"),
            PopulareMovieListView(),
            SeeMoreRow(text: "Top Rated"),
            TopRatedListView(),
          ],
        ),
      ),
    );
  }
}
