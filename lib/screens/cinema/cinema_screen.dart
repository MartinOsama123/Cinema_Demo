import 'package:flutter/material.dart';

import 'package:movie_app/models/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/screens/cinema/components/payment_info.dart';
import 'package:movie_app/screens/cinema/components/people_data.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:movie_app/screens/cinema/components/cinema_chairs.dart';

class CinemaScreen extends StatefulWidget {
  final Movie movie;

  const CinemaScreen({Key key, this.movie}) : super(key: key);

  @override
  _CinemaScreenState createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PeopleData(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // perspective
                    ..rotateX(50 * math.pi / 180),
                  alignment: Alignment.center,
                  child: Hero(
                    tag: "poster",
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(widget.movie.poster),
                              fit: BoxFit.fill)),
                      height: MediaQuery.of(context).size.height * 0.40,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: CinemaChairs(10, 10),
                ),
                Expanded(
                  flex: 1,
                  child: Row(children: [
                    Icon(
                      Icons.event_seat,
                      color: Colors.white,
                    ),
                    Text(" = Available",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Icon(
                      Icons.event_seat,
                      color: Colors.grey.shade900,
                    ),
                    Text(" = Unavailable",
                        style: TextStyle(color: Colors.white, fontSize: 15))
                  ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
                ),
                PaymentInfo(),
              ],
            ),
            SafeArea(
              child: BackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
