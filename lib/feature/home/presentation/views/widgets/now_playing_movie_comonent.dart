import 'package:flutter/material.dart';

class NowPlayingMovieComponent extends StatelessWidget {
  const NowPlayingMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          // الصورة
          Image.asset(
            'assets/images/cartoon_test.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, 
                end: Alignment.topCenter, 
                colors: [Colors.grey.shade900, Colors.transparent],
              ),
            ),
          ),
          // now playing
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      CircleAvatar(radius: 5, backgroundColor: Colors.red),
                      Text("Now Playing"),
                    ],
                  ),
                ),
                Text("The Bad Guys"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
