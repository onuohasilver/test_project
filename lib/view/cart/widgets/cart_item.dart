import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'drop_down.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      // width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/medicine1.png',
              fit: BoxFit.contain, height: 80.h, width: 80.h),
          const XSpace(14),
          Column(
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
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 58.w,
                height: 31.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Spacer(flex: 2),
                    DropDown(),
                    Spacer(),
                  ],
                ),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.delete_outline, color: DroColors.purple),
                  label: const Text(
                    'Remove',
                    style: TextStyle(color: DroColors.purple),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
