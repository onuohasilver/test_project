import 'package:flutter/cupertino.dart';

///Custom App Colors
class DroColors {
  ///Colors
  static const Color turquoise = Color(0xFF0CB8B6);
  static const Color purple = Color(0xFF9F5DE2);
  static const Color middleBlue = Color(0xFF5C86CE);
  static const Color lightGrey = Color(0xFFF2F2F2);
  static const Color darkGrey = Color.fromRGBO(54, 54, 54, 1);

  ///Gradients
  static const LinearGradient purpleGradient = LinearGradient(
      colors: [Color(0xFF7A08FA), Color(0xffAD3BFC)], stops: [.05, .5]);

  static const LinearGradient redGradient =
      LinearGradient(colors: [Color(0xFFFE806F), Color(0xffE5366A)]);
}
