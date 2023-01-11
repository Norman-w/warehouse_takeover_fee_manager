import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';



const colorizeTextStyle = TextStyle(
  fontSize: 50.0,
  fontFamily: 'Horizon',
);
const defaultWaitingTexts = [
  "Loading...","Please", "Wait"
];
// const defaultColors = [
//   Colors.purple,
//   Colors.blue,
//   Colors.yellow,
//   Colors.red,
// ];
class ColorfulLoading extends StatelessWidget {
  final List<String>? texts;
  final List<MaterialColor>? colors;
  const ColorfulLoading({Key? key, this.texts, this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var defaultColors = [
      theme.primaryColor,theme.backgroundColor,theme.highlightColor
    ];
    var showingTexts = texts?? defaultWaitingTexts;
    var showingColors = colors?? defaultColors;
    var textsElems = showingTexts.map((e) => ColorizeAnimatedText(e, textStyle: colorizeTextStyle, colors: showingColors)).toList();
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
