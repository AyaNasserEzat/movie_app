import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/core/utils/functions/app_bar.dart';
import 'package:movies_app/feature/movie/presentation/mangers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/popular_movies_body.dart';

class PopularMoviesView extends StatelessWidget {
  const PopularMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PopularMovieCubit>()..fetchPopularMovies(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xff1e1e29),
        appBar: customAppBar(title: "Popular movies", context: context),
        body: PopularMoviesBody(),
      ),
    );
  }
}
