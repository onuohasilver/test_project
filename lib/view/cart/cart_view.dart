import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/widgets/cart_item.dart';
import 'package:drotest/view/product/widget/add_to_cart_modal.dart';
import 'package:drotest/view/shared/custom_flat_button.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: const TopBar(
            title: CustomText(
              'Cart',
              size: 22,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          preferredSize: Size(414.w, 171.h)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 34.w),
        child: SizedBox(
          height: 752.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const YSpace(10),
              Expanded(
                child: SizedBox(
                  height: 704.h,
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return const CartItem();
                    },
                  ),
                ),
              ),
              CustomFlatButton(
                child: const CustomText('Add to cart',
                    color: Colors.white, size: 14, weight: FontWeight.bold),
                onTap: () {
                  showAddToCartModal(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
