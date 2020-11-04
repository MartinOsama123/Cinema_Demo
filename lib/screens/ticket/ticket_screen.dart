import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:flutter/foundation.dart';

import 'dart:math' as math;

import 'package:movie_app/screens/cinema/components/cinema_chairs.dart';

class TicketScreen extends StatefulWidget {
  final Movie movie;

  const TicketScreen({Key key, this.movie}) : super(key: key);

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
