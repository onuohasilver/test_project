import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailContainer extends StatelessWidget {
  final String icon, title, subtitle;
  const ProductDetailContainer({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 151.w,
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/$icon',
            color: DroColors.purple,
            height: 21.h,
            width: 28.w,
          ),
          const XSpace(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                title,
                color: DroColors.middleBlue.withOpacity(.7),
                size: 10,
              ),
              CustomText(
                subtitle,
                color: DroColors.middleBlue,
                size: 14,
                weight: FontWeight.bold,
              ),
            ],
          )
        ],
      ),
    );
  }
}
