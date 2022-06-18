import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
                child: Text('Your Result', style: kTitleTextStyle)),
          )
        ],
      )
    );
  }
}
