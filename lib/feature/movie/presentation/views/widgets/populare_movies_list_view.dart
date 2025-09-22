
import 'package:flutter/material.dart';
import 'package:movies_app/feature/movie/presentation/views/movie_details_view.dart';

class PopulareMovieListView extends StatelessWidget {
  const PopulareMovieListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height * .22,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MovieDetailsView();
              }));
            },
            child: Padding(
              padding:  const EdgeInsets.only(left: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 2.6/4,
                  child: Image.asset(
                    "assets/images/cartoon_test.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
