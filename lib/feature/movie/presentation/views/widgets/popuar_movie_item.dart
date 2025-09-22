import 'package:flutter/material.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/custom_movie_image.dart';
import 'package:movies_app/feature/movie/presentation/views/widgets/realse_year_widget.dart';

class PopularMovieItem extends StatelessWidget {
  const PopularMovieItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .21,
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
            CustomMovieImage(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    "Demon Slayer-Kimetsu no",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RealseYearWidget(realseYear: '2020',),
                      SizedBox(width: 20),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text("4.5"),
                    ],
                  ),
                  Text(
                    "Ταημό tamasa, jonct with mea Hushihiro soy sad my boors whe",
                    style: TextStyle(fontSize: 14),
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
