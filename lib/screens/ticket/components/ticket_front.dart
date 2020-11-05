import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

import 'package:barcode_flutter/barcode_flutter.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TicketFront extends StatefulWidget {
  @override
  _TicketFrontState createState() => _TicketFrontState();
}

class _TicketFrontState extends State<TicketFront> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 1,
        child: Container(
          height: 270,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.black),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              "IMAX",
                              style: TextStyle(
                                  color: kSecondaryColor, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "CINEMA TICKET  ",
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            "MOVIE NAME",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "THEATRE",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Text(
                              "02",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "ROW",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Text(
                              "08",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "SEAT",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            Text(
                              "67",
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "BARCODE: 1234ABCD",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                            BarCodeImage(
                              params: Code39BarCodeParams(
                                "1234ABCD",
                                lineWidth:
                                    1.0, // width for a single black/white bar (default: 2.0)
                                barHeight:
                                    40.0, // height for the entire widget (default: 100.0)
                                // Render with text label or not (default: false)
                              ),
                              onError: (error) {
                                // Error handler
                                print('error = $error');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Transform.rotate(
                  angle: -15 / 180 * pi,
                  child: SvgPicture.asset(
                    "assets/images/cinema.svg",
                    color: Colors.white.withOpacity(0.2),
                    width: 180,
                    height: 180,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
