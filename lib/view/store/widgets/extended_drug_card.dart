import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/custom_tap_detector.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExtendedDrugCard extends StatelessWidget {
  const ExtendedDrugCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 242.h,
      width: 168.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.3))]),
      child: CustomTapDetector(
        onTap: () {},
        radius: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70.h,
              width: 114.w,
              color: DroColors.lightGrey,
              alignment: Alignment.center,
              child: Image.asset('assets/medicine1.png', fit: BoxFit.contain),
            ),
            const YSpace(13),
            Padding(
              padding: EdgeInsets.only(left: 11.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText('Panadol',
                      size: 16, color: DroColors.darkGrey),
                  const YSpace(2),
                  const CustomText('Analgesic', size: 14, color: Colors.grey),
                  const YSpace(2),
                  Row(
                    children: [
                      const CustomText('₦5000.00',
                          size: 18, weight: FontWeight.bold),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.favorite_border_rounded,
                            color: DroColors.purple),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 40.h,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            primary: DroColors.purple,
                          ),
                          child: const CustomText('ADD TO CART',
                              size: 13, color: DroColors.purple)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
