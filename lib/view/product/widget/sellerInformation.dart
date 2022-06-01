import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          elevation: 1,
          color: Colors.white,
          type: MaterialType.circle,
          child: Image.asset(
            'assets/emzor.png',
            fit: BoxFit.contain,
            width: 40.w,
            height: 40.w,
          ),
        ),
        const XSpace(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomText(
              'SOLD BY',
              color: Colors.grey,
              size: 10,
            ),
            CustomText(
              'Emzor Pharmaceuticals',
              size: 14,
              color: DroColors.middleBlue,
              weight: FontWeight.bold,
            )
          ],
        ),
        const Spacer(),
        Material(
          color: DroColors.purple.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(Icons.favorite_outline, color: DroColors.purple),
            ),
          ),
        )
      ],
    );
  }
}
