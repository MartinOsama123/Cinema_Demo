import 'package:flutter/material.dart';

class ChairsStateInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        Icons.event_seat,
        color: Colors.white,
      ),
      Text(" = Available", style: TextStyle(color: Colors.white, fontSize: 15)),
      Icon(
        Icons.event_seat,
        color: Colors.grey.shade900,
      ),
      Text(" = Unavailable",
          style: TextStyle(color: Colors.white, fontSize: 15))
    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly);
  }
}
