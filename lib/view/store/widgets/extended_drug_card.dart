import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:drotest/view/product/product_view.dart';
import 'package:drotest/view/product/widget/widget.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExtendedDrugCard extends StatelessWidget {
  const ExtendedDrugCard({
    Key? key,
    required this.drug,
  }) : super(key: key);
  final Item drug;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Container(
            height: 242.h,
            width: 168.w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.3))]),
            child: CustomTapDetector(
              onTap: () {
                navigateTo(context, ProductView(drug: drug));
              },
              radius: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 70.h,
                    width: 114.w,
                    color: DroColors.lightGrey,
                    alignment: Alignment.center,
                    child: Image.asset(drug.imageUrl, fit: BoxFit.contain),
                  ),
                  const YSpace(13),
                  Padding(
                    padding: EdgeInsets.only(left: 11.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(drug.name,
                            size: 16, color: DroColors.darkGrey),
                        const YSpace(2),
                        CustomText(drug.type, size: 14, color: Colors.grey),
                        const YSpace(2),
                        Row(
                          children: [
                            CustomText('₦${drug.price}.00',
                                size: 18, weight: FontWeight.bold),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.favorite_border_rounded,
                                  color: DroColors.purple),
                              onPressed: () {},
                            )
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            height: 40.h,
                            child: OutlinedButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                      CartItemAdded(CartModelItem(1, drug)));
                                  showAddToCartModal(context, drug);
                                },
                                style: OutlinedButton.styleFrom(
                                  primary: DroColors.purple,
                                ),
                                child: const CustomText('ADD TO CART',
                                    size: 13, color: DroColors.purple)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const CircularProgressIndicator(
            color: DroColors.purple, strokeWidth: 2);
      },
    );
  }
}
