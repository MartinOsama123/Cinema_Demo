import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/models/movie.dart';

import '../../../constants.dart';

class TitleDuration extends StatelessWidget {
  final Movie movie;

  const TitleDuration({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultPadding / 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    movie.year.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "PG-13",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "1h 30min",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          )),
          Spacer(),
          Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30,
              color: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
