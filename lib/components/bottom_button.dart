import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText, @required this.onTap});

  final String buttonText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        child: Center(child: Text(buttonText, style: kLargeButtonTextStyle,)),
      ),
    );
  }
}
