import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/product/product_view.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrugCard extends StatelessWidget {
  const DrugCard({Key? key, required this.drug}) : super(key: key);
  final Item drug;

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
          navigateTo(context, ProductView(drug: drug));
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
                child: Image.asset(drug.imageUrl, fit: BoxFit.contain),
              ),
            ),
            const YSpace(13),
            Padding(
              padding: EdgeInsets.only(left: 11.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(drug.name, size: 16, color: DroColors.darkGrey),
                  const YSpace(2),
                  CustomText(drug.type, size: 14, color: Colors.grey),
                  const YSpace(9),
                  CustomText('₦${drug.price}.00',
                      size: 18, weight: FontWeight.bold),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
