import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  // final Widget child;
  const TopBar(
      {Key? key,
      // required this.child,
      this.enableSearch = false,
      this.height = 120})
      : super(key: key);

  final bool enableSearch;
  final double height;
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      height: height.h,
      width: 414.w,
      decoration: const BoxDecoration(
          gradient: DroColors.purpleGradient,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .07),
        child: Column(
          children: [
            const YSpace(66),
            Row(
              children: [
                const CustomText(
                  'Pharmacy',
                  size: 22,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
                const Spacer(),
                SvgPicture.asset('assets/heart.svg',
                    height: 25.w, width: 22.w, color: Colors.white)
              ],
            ),
            const YSpace(21),
            Visibility(
              visible: enableSearch,
              child: SizedBox(
                height: 36.h,
                width: 366.w,
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(Icons.search,
                          color: Colors.white, size: 15),
                      fillColor: Colors.white24,
                      filled: true,
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
