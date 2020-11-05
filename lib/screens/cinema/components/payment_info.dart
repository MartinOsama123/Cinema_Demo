import 'package:flutter/material.dart';
import 'package:movie_app/screens/cinema/components/people_data.dart';
import 'package:movie_app/screens/ticket/ticket_screen.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class PaymentInfo extends StatefulWidget {
  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  final double ticketPrice = 60.0;
  @override
  Widget build(BuildContext context) {
    var numOfPeople = Provider.of<PeopleData>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
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
                    "${numOfPeople.numberOfPeople * ticketPrice}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketScreen()),
                );
              },
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
