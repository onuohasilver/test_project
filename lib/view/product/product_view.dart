import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/cart_view.dart';
import 'package:drotest/view/product/widget/widget.dart';
import 'package:drotest/view/shared/custom_flat_button.dart';
import 'package:drotest/view/shared/shared.dart';
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
              height: size.height * 1.15,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SellerInformation(),
                        YSpace(22),
                        QuantityAndPriceSelector(amount: 200),
                        YSpace(34),
                        ProductDetails(),
                        YSpace(30),
                        CustomText('Similar Products',
                            size: 18, align: TextAlign.left),
                      ],
                    ),
                  ),
                  const YSpace(17),
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
                            // child: const DrugCard(),
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
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 414.w,
                height: 95.h,
                color: Colors.white,
                child: Center(
                  child: CustomFlatButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const CartView();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        XSpace(10),
                        CustomText('Add to cart',
                            color: Colors.white,
                            size: 14,
                            weight: FontWeight.bold),
                      ],
                    ),
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
