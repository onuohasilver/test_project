import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';

class FloatingDrugPrice extends StatelessWidget {
  final int amount;
  const FloatingDrugPrice({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('₦', size: 14),
        CustomText('$amount', size: 32),
        const CustomText('.00', size: 18)
      ],
    );
  }
}
