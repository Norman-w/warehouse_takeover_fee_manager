import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


const colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);

class ColorfulLoading extends StatelessWidget {
  const ColorfulLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Center(child:
      AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'Loading...',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
        ),
        ColorizeAnimatedText(
          'Please',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
        ),
        ColorizeAnimatedText(
          'Wait',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
        ),
      ],
      isRepeatingAnimation: true,
      onTap: () {
        print("Tap Event");
      },
      ),
    );
  }
}
