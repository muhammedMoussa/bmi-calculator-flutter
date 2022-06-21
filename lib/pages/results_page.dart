import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult, this.bmiText, this.interpretation});

  final String bmiResult;
  final String bmiText;
  final String interpretation;

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
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle)),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                  colour: kActiveCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmiText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        style: KBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
              ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          )
        ],
      )
    );
  }
}
