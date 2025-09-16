import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/now_playing_movie_comonent.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NowPlayingMovieComponent(),
        ],
      ),
    );
  }
}

