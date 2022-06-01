import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {Key? key, required this.title, this.onTap, this.buttonText})
      : super(key: key);

  final String title;
  final String? buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(title,
              size: 16,
              weight: FontWeight.bold,
              color: DroColors.darkGrey.withOpacity(.4)),
          Visibility(
            visible: buttonText != null,
            child: TextButton(
              child: Text(
                "$buttonText",
                style: const TextStyle(
                    color: DroColors.purple, fontWeight: FontWeight.bold),
              ),
              onPressed: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
