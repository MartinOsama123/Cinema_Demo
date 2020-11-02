import 'package:flutter/material.dart';

class CinemaChairs extends StatefulWidget {
  int col;
  int row;
  var chairs;

  CinemaChairs(int col, int row) {
    this.col = col;
    this.row = row;
    this.chairs = List.generate(row, (i) => List(col), growable: false);
  }
  @override
  _CinemaChairsState createState() => _CinemaChairsState();
}

class _CinemaChairsState extends State<CinemaChairs> {
  int totalPeople = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (context, i) => Container(
          padding: const EdgeInsets.all(5),
          height: 30,
          child: ListView.builder(
            itemBuilder: (context, j) => GestureDetector(
              onTap: () {
                print('tabbed');
                setState(() {
                  if (widget.chairs[i][j] == null) {
                    widget.chairs[i][j] = true;
                    print(widget.chairs[i][j]);
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
                  color:
                      widget.chairs[i][j] == true ? Colors.green : Colors.white,
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
