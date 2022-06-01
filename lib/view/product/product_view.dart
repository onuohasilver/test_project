import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/product/widget/widget.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/widgets/drug_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Scaffold(
      appBar: PreferredSize(
          child: const TopBar(), preferredSize: Size(414.w, 171.h)),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              height: size.height * 1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/medicine1.png',
                      height: 170.h, width: 170.h),
                  const YSpace(13),
                  const CustomText('Emzor Paracetamol',
                      size: 20, weight: FontWeight.w700),
                  const YSpace(8),
                  const CustomText('Tablet - 500mg',
                      size: 18, color: Colors.grey),
                  const YSpace(43),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      children: const [
                        SellerInformation(),
                        YSpace(22),
                        QuantityAndPriceSelector(amount: 200),
                        YSpace(34),
                        ProductDetails(),
                        YSpace(30)
                      ],
                    ),
                  ),
                  const CustomText('Similar Products',
                      size: 18, align: TextAlign.left),
                  Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 24.w),
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            height: 206.h,
                            width: 155.w,
                            child: const DrugCard(),
                          ),
                        );
                      },
                    ),
                  ),
                  const YSpace(10)
                ],
              ),
            ),
          ),
          Positioned.fill(
            bottom: 27.h,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: DroColors.purpleGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.white),
                  label: const CustomText('Add to cart',
                      color: Colors.white, size: 14, weight: FontWeight.bold),
                  style: TextButton.styleFrom(
                    fixedSize: Size(364.w, 50.h),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
