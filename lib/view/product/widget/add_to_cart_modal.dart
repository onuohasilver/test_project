import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/cart_view.dart';
import 'package:drotest/view/shared/custom_flat_button.dart';
import 'package:drotest/view/store/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future showAddToCartModal(BuildContext context) {
  SizeReference size = SizeReference(context);
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoaded) {
              return Container(
                height: size.height * .35,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * .05),
                      child: Text(
                        '${state.cart.items.last.name} has been succesfully added to cart!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: size.width * .047),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    CustomFlatButton(
                      child: const Center(
                        child: Text(
                          'VIEW CART',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartView(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: size.height * .01),
                    SizedBox(
                      width: size.width * .8,
                      height: size.height * .055,
                      child: OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                const BorderSide(color: DroColors.purple)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StoreView(),
                            ),
                          );
                        },
                        child: const Text(
                          'CONTINUE SHOPPING',
                          style: TextStyle(
                            color: DroColors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        );
      });
}
