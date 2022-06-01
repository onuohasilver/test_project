import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/product/widget/widget.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SizeReference size = SizeReference(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText('PRODUCT DETAILS',
            size: 14,
            weight: FontWeight.bold,
            color: DroColors.middleBlue.withOpacity(.7)),
        const YSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ProductDetailContainer(
              icon: 'drug.svg',
              subtitle: '8 x 12 tablets (96)',
              title: 'PACK SIZE',
            ),
            ProductDetailContainer(
              icon: 'qr.svg',
              subtitle: 'PRO23232311',
              title: 'PRODUCT ID',
            ),
          ],
        ),
        const YSpace(25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ProductDetailContainer(
              icon: 'drugsingle.svg',
              subtitle: 'Paracetamol',
              title: 'CONSTITUENTS',
            ),
            ProductDetailContainer(
              icon: 'pack.svg',
              subtitle: 'Packs',
              title: 'DISPENSED IN',
            ),
          ],
        ),
        const YSpace(37),
        const CustomText(
            '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets',
            size: 14,
            color: Colors.grey),
      ],
    );
  }
}
