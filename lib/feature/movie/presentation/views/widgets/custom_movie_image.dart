
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    this.borderRadius=10,
    required this.imageUrl
  });
final double borderRadius;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w500$imageUrl",
          fit: BoxFit.fill,
          errorWidget:(context, url, error) =>  Icon(Icons.error),
        ),
      ),
    );
  }
}
