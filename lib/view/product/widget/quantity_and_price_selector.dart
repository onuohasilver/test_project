import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'floating_drug_price.dart';

class QuantityAndPriceSelector extends StatefulWidget {
  final int amount;
  const QuantityAndPriceSelector({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  _QuantityAndPriceSelectorState createState() =>
      _QuantityAndPriceSelectorState();
}

class _QuantityAndPriceSelectorState extends State<QuantityAndPriceSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove, size: 24.h), onPressed: () {}),
              const CustomText('0', size: 20, weight: FontWeight.bold),
              IconButton(
                icon: Icon(Icons.add, size: 24.h),
                onPressed: () {},
              )
            ],
          ),
        ),
        const XSpace(15),
        const CustomText(
          'Pack(s)',
          size: 14,
          color: Colors.grey,
        ),
        const Spacer(),
        FloatingDrugPrice(amount: widget.amount),
      ],
    );
  }
}
