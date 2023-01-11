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
const defaultWaitingTexts = [
  "Loading...","Please", "Wait"
];
class ColorfulLoading extends StatelessWidget {
  final List<String>? texts;
  const ColorfulLoading({Key? key, this.texts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> showingTexts = texts?? defaultWaitingTexts;
    var textsElems = showingTexts.map((e) => ColorizeAnimatedText(e, textStyle: colorizeTextStyle, colors: colorizeColors)).toList();
    return
    Center(child:
      AnimatedTextKit(
      animatedTexts: textsElems,
      isRepeatingAnimation: true,
      onTap: () {
        print("Tap Event");
      },
      ),
    );
  }
}
