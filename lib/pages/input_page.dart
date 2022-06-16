import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/card_icon_text.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inActiveCardColor;
  Color femaleColor = inActiveCardColor;
  void onGenderChange(String gender) {
    if (gender == "MALE") {
      maleColor = activeCardColor;
      femaleColor = inActiveCardColor;
    } else {
      maleColor = inActiveCardColor;
      femaleColor = activeCardColor;
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
            Expanded(child: ReusableCard(colour: activeCardColor)),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReusableCard(colour: activeCardColor)),
                  Expanded(child: ReusableCard(colour: activeCardColor)),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
