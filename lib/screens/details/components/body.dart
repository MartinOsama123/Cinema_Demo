import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import '../../../constants.dart';

class DetailsBody extends StatelessWidget {
  final Movie movie;

  const DetailsBody({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Hero(
      tag: "poster",
      child: Container(
        height: size.height * 0.40,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.40 - 50,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50)),
                  boxShadow: [kDefaultShadow],
                  image: DecorationImage(
                      image: AssetImage(movie.poster), fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: size.width * 0.90,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 50,
                          color: Color(0xFF12153D).withOpacity(0.2))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 40,
                        ),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          movie.rating.toString() + "/ 10",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border_outlined, size: 40),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Rate this",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            movie.metascoreRating.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding / 4,
                        ),
                        Text(
                          "Meta Score",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SafeArea(child: BackButton())
          ],
        ),
      ),
    );
  }
}
