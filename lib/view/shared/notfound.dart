import 'package:drotest/view/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/NotFound.png', height: 314.h, width: 314.w),
        const CustomText('No Result Found for "Ibroprofen"', size: 20)
      ],
    );
  }
}
