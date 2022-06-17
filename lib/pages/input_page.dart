import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/card_icon_text.dart';
import 'package:bmi_calculator/utils/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInActiveCardColor;
  Color femaleColor = kInActiveCardColor;
  int height = 180;

  void onGenderChange(String gender) {
    if (gender == "MALE") {
      maleColor = kActiveCardColor;
      femaleColor = kInActiveCardColor;
    } else {
      maleColor = kInActiveCardColor;
      femaleColor = kActiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: maleColor,
                    onClick: () => setState(() {
                      onGenderChange("MALE");
                    }),
                    child: CardIconText(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: "MALE",
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onClick: () => setState(() {
                      onGenderChange("thing");
                    }),
                    colour: femaleColor,
                    child: CardIconText(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: "FEMALE",
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT', style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                          height.toString(),
                        style: kNumberTextStyle
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      min: 122.0,
                      max: 222.0,
                      onChanged: (ev) {
                        setState(() {
                          height = ev.round();
                        });
                      }
                  ),
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(colour: kActiveCardColor)),
                  Expanded(child: ReusableCard(colour: kActiveCardColor)),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}
