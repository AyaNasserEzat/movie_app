import 'package:flutter/material.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/realse_year_widget.dart';
import 'package:movies_app/feature/home/presentation/views/widgets/similar_movie_grid_view.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e1e29),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/cartoon_test.jpg",
              fit: BoxFit.fill,
              height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    "Turning red",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      RealseYearWidget(
                        realseYear: '2020',
                        color: Color(0xff303030),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text("4.5"),
                      SizedBox(width: 30),
                      Text("1 h 40m"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Thirteen year old Mei is experiencing the awkwardness of being a teenager with a twist-when she gets too excited, she transtorms o giant red panda.",
                  ),

                  Text(
                    "Geners :Animation,fantisy,commdy ,family",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 5),
                  Text("MORE LIKE THIS", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  MoviesGridView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
