import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/cinema/cinema_screen.dart';
import 'package:movie_app/screens/details/components/body.dart';
import 'package:movie_app/screens/details/components/cast.dart';
import 'package:movie_app/screens/details/components/title_duration.dart';
import 'package:movie_app/screens/home/home_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsBody(
            movie: movie,
          ),
          TitleDuration(
            movie: movie,
          ),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.genra.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    movie.genra[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1.5,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              "Plot Summary",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              movie.plot,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              "Cast & Crew",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
          ),
          CastCrew(movie: movie),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: FlatButton(
                    minWidth: MediaQuery.of(context).size.width * 0.75,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: kSecondaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CinemaScreen(
                                  movie: movie,
                                )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Buy Tickets",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ))),
          )
        ],
      ),
    ));
  }
}
