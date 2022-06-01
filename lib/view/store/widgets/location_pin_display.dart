import 'package:drotest/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationPinDisplay extends StatelessWidget {
  const LocationPinDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: DroColors.lightGrey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 17.h),
        child: Row(
          children: [
            SvgPicture.asset('assets/pin.svg'),
            const SizedBox(width: 10),
            const Text.rich(
              TextSpan(text: 'Delivery in ', children: [
                TextSpan(
                    text: 'Lagos, NG',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
