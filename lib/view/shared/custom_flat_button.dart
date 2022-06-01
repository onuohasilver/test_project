import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton(
      {Key? key, this.child, this.height = 50, this.width = 364, this.onTap})
      : super(key: key);

  final Widget? child;
  final double height, width;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: DroColors.purpleGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onTap,
        child: child ??
            Row(
              children: const [
                Icon(Icons.shopping_cart_outlined, color: Colors.white),
                CustomText('Add to cart',
                    color: Colors.white, size: 14, weight: FontWeight.bold),
              ],
            ),
        style: TextButton.styleFrom(fixedSize: Size(width.w, height.h)),
      ),
    );
  }
}
