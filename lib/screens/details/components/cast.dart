import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class CastCrew extends StatelessWidget {
  final Movie movie;

  const CastCrew({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movie.cast.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(movie.cast[index]['image']))),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                movie.cast[index]['orginalName'],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
