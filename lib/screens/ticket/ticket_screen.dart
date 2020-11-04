import 'package:flutter/material.dart';
import 'package:movie_app/screens/ticket/components/ticket_back.dart';
import 'package:movie_app/screens/ticket/components/ticket_front.dart';
import 'dart:math' as math;

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  double rotationDegree = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Container(
            height: 400,
            child: Column(
              children: [
                Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi * rotationDegree),
                    origin: Offset(MediaQuery.of(context).size.width / 2, 0),
                    child: rotationDegree < 0.5 ? TicketFront() : TicketBack()),
                Slider(
                    value: rotationDegree,
                    onChanged: (double value) {
                      setState(() {
                        rotationDegree = value;
                      });
                    })
              ],
            ),
          ),
        ),
        SafeArea(child: BackButton()),
      ],
    ));
  }
}
