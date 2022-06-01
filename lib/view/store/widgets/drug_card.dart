import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/product/product_view.dart';
import 'package:drotest/view/shared/custom_tap_detector.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232.h,
      width: 168.w,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.3))]),
      child: CustomTapDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ProductView())));
        },
        radius: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(10)),
              child: Container(
                height: 127.h,
                width: 168.w,
                color: DroColors.lightGrey,
                alignment: Alignment.center,
                child: Image.asset('assets/medicine1.png', fit: BoxFit.contain),
              ),
            ),
            const YSpace(13),
            Padding(
              padding: EdgeInsets.only(left: 11.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CustomText('Panadol', size: 16, color: DroColors.darkGrey),
                  YSpace(2),
                  CustomText('Analgesic', size: 14, color: Colors.grey),
                  YSpace(9),
                  CustomText('₦5000.00', size: 18, weight: FontWeight.bold),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
