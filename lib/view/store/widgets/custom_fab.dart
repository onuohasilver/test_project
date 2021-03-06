import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/cart_view.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFab extends StatelessWidget {
  final bool switchFAB;
  const CustomFab(
    this.switchFAB, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartView()),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              constraints: BoxConstraints.tight(
                Size(
                  switchFAB ? 43.w : 135.w,
                  43.h,
                ),
              ),
              decoration: BoxDecoration(
                  gradient: DroColors.redGradient,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 5)
                  ],
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(1000)),
              child: switchFAB
                  ? const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    )
                  : Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              'Checkout',
                              size: 14,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 18.h,
                            ),
                            Material(
                              color: Colors.yellow,
                              type: MaterialType.circle,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: CustomText(
                                  "${state.cart.items.length}",
                                  size: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
