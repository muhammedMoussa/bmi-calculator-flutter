
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/card_icon_text.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInActiveCardColor;
  Color femaleColor = kInActiveCardColor;
  int height = 180;
  int weight = 60;
  int age = 20;

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x20EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 122.0,
                        max: 222.0,
                        onChanged: (ev) {
                          setState(() {
                            height = ev.round();
                          });
                        }
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                    colour: kActiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle  ,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kLabelTextStyle  ,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonText: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        bmiText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )
                  )
                );
              },
            )
          ],
        ));
  }
}