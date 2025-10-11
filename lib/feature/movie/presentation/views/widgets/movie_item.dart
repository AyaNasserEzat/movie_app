import 'package:flutter/material.dart';
import 'package:movies_app/feature/movie/domain/entites/movie_enitiy.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/realse_year_widget.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movieEntity});
  final MovieEntity movieEntity;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isLandScap =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: isLandScap ? screenHeight * .40 : screenHeight * .20,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff303030),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            CustomMovieImage(imageUrl: movieEntity.backdropPath),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  SizedBox(height: 10),
                  Text(
                    movieEntity.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RealseYearWidget(
                        realseYear: movieEntity.releaseDate.substring(0, 4),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(movieEntity.voteAverage.toString()),
                    ],
                  ),
                  Text(
                    movieEntity.overview,
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
