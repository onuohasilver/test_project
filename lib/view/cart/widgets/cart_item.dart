import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'drop_down.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.model,
  }) : super(key: key);
  final CartModelItem model;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      // width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(model.item.imageUrl,
              fit: BoxFit.contain, height: 80.h, width: 80.h),
          const XSpace(14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(model.item.name, size: 16, color: DroColors.darkGrey),
              const YSpace(2),
              CustomText(model.item.type, size: 14, color: Colors.grey),
              const YSpace(9),
              CustomText('₦${model.item.price * model.quantity}.00',
                  size: 18, weight: FontWeight.bold),
            ],
          ),
          const Spacer(),
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 58.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(flex: 2),
                      DropDown(item: model),
                      const Spacer(),
                    ],
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      context
                          .read<CartBloc>()
                          .add(CartItemRemoved(CartModelItem(0, model.item)));
                    },
                    icon: const Icon(Icons.delete_outline,
                        color: DroColors.purple),
                    label: const Text(
                      'Remove',
                      style: TextStyle(color: DroColors.purple),
                    ))
              ],
            );
          })
        ],
      ),
    );
  }
}
