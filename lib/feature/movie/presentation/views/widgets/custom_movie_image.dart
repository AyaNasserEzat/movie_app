
import 'package:flutter/material.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    this.borderRadius=10,
  });
final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          "assets/images/cartoon_test.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
