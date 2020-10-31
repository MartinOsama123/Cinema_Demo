import 'package:flutter/material.dart';

class CinemaChairs extends StatefulWidget {
  final  int col;
  final int row;

  const CinemaChairs({Key key, this.col, this.row}) : super(key: key);
  @override
  _CinemaChairsState createState() => _CinemaChairsState();
}

class _CinemaChairsState extends State<CinemaChairs> {

  int totalPeople = 0;

  var chairs;
  @override
  Widget build(BuildContext context) {
    chairs =  List.generate(widget.row, (i) => List(widget.col), growable: false);

    return Container(
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
                  size: 20,
                  color: chairs[i][j] == true
                      ? Colors.green
                      : Colors.white,
                ),
              ),
            ),
            itemCount: widget.row,
            scrollDirection: Axis.horizontal,
          ),
        ),
        itemCount: widget.col,
        scrollDirection: Axis.vertical,
      ),
    );
  }
  
}