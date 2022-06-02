import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/widgets/cart_item.dart';
import 'package:drotest/view/shared/custom_flat_button.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator(
              color: DroColors.purple, strokeWidth: 2);
        }
        if (state is CartLoaded) {
          if (state.cart.items.isEmpty) {
            return const Center(child: NotFound());
          }
          return Padding(
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
                        itemCount: state.cart.items.length,
                        itemBuilder: (context, index) {
                          return CartItem(
                            model: state.cart.items[index],
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 107.h,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const CustomText('Total:', size: 18),
                        const XSpace(9),
                        CustomText('₦${state.cart.totalPrice}.00',
                            size: 20, weight: FontWeight.bold),
                        const Spacer(),
                        CustomFlatButton(
                            width: 157,
                            onTap: () {},
                            child: const Center(
                              child: CustomText(
                                'CHECKOUT',
                                size: 15,
                                color: Colors.white,
                                weight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const CustomText('An Error Occured', size: 14);
      }),
    );
  }
}
