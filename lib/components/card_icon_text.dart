import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class CardIconText extends StatelessWidget {
  CardIconText({@required this.cardIcon, this.cardText});

  final IconData cardIcon;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            cardIcon,
            size: 80.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(cardText,
              style: TextStyle(fontSize: 18.0, color: kCardChildColor)),
        ]);
  }
}
