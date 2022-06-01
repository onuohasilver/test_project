import 'package:drotest/view/shared/custom_text.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('NotFound.png'),
        const CustomText('No Result Found for "Ibroprofen"', size: 20)
      ],
    );
  }
}
