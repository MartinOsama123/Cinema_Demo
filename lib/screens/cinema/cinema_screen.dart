import 'package:flutter/material.dart';

import 'package:movie_app/models/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/screens/cinema/components/chairs_state_info.dart';
import 'package:movie_app/screens/cinema/components/cinema_3d_screen.dart';
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
                Cinema3DScreen(
                  movie: widget.movie,
                ),
                Expanded(
                  flex: 5,
                  child: CinemaChairs(10, 10),
                ),
                Expanded(
                  flex: 1,
                  child: ChairsStateInfo(),
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
