import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class Cinema3DScreen extends StatelessWidget {
  final Movie movie;

  const Cinema3DScreen({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // perspective
        ..rotateX(50 * pi / 180),
      alignment: Alignment.center,
      child: Hero(
        tag: "poster",
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(movie.poster), fit: BoxFit.fill)),
          height: MediaQuery.of(context).size.height * 0.40,
        ),
      ),
    );
  }
}
