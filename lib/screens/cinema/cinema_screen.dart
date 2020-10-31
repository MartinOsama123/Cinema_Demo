import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/models/movie.dart';
import 'package:flutter/foundation.dart';

import 'dart:math' as math;

class CinemaScreen extends StatefulWidget {
  final Movie movie;

  const CinemaScreen({Key key, this.movie}) : super(key: key);

  @override
  _CinemaScreenState createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  static int row = 10;
  static int col = 10;
  String pressed = "false";
  int totalPeople = 0;
  var chairs = List.generate(row, (i) => List(col), growable: false);
  @override
  Widget build(BuildContext context) {
    const double ticketPrice = 60.0;

    return Scaffold(
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
                  tag: 'poster',
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
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ListView.builder(
                    itemBuilder: (context, i) => Container(
                      padding: const EdgeInsets.all(5),
                      height: 30,
                      child: ListView.builder(
                        itemBuilder: (context, j) => GestureDetector(
                          onTap: () {
                            setState(() {
                              if (chairs[i][j] == null) {
                                chairs[i][j] = true;
                                totalPeople++;
                              }
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.event_seat,
                              color: chairs[i][j] == true
                                  ? Colors.green
                                  : Colors.white,
                            ),
                          ),
                        ),
                        itemCount: row,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    itemCount: col,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              Expanded(
                flex:1,
                child: Row(children: [
                  Icon(Icons.event_seat,color: Colors.white,),
                  Text(" = Available",style: TextStyle(color: Colors.white,fontSize: 15)),
                  Icon(Icons.event_seat,color: Colors.grey.shade900,),
                  Text(" = Unavailable",style: TextStyle(color: Colors.white,fontSize: 15))
                ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly),
              ),
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Price:",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            "${totalPeople * ticketPrice}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(7),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kSecondaryColor),
                      child: Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ))
                  ],
                ),


            ],
          ),

          SafeArea(
            child: BackButton(),
          ),
        ],
      ),
    );
  }
}
