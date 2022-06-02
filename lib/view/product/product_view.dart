import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:drotest/view/product/bloc/counter_bloc.dart';
import 'package:drotest/view/product/widget/widget.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key, required this.drug}) : super(key: key);
  @override
  State<ProductView> createState() => _ProductViewState();
  final Item drug;
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Scaffold(
      appBar: PreferredSize(
          child: TopBar(
            icon: 'delivery.svg',
            title: const CustomText(
              'Pharmacy',
              size: 22,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
            leadingTap: () {
              Navigator.pop(context);
            },
          ),
          preferredSize: Size(414.w, 171.h)),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              height: size.height * 1.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(widget.drug.imageUrl,
                      height: 170.h, width: 170.h),
                  const YSpace(13),
                  CustomText(widget.drug.name,
                      size: 20, weight: FontWeight.w700),
                  const YSpace(8),
                  CustomText(widget.drug.type, size: 18, color: Colors.grey),
                  const YSpace(43),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SellerInformation(),
                        const YSpace(22),
                        QuantityAndPriceSelector(
                            amount: widget.drug.price, item: widget.drug),
                        const YSpace(34),
                        const ProductDetails(),
                        const YSpace(30),
                        const CustomText('Similar Products',
                            size: 18, align: TextAlign.left),
                      ],
                    ),
                  ),
                  const YSpace(17),
                  Flexible(
                    child: BlocBuilder<CatalogBloc, CatalogState>(
                        builder: (context, state) {
                      if (state is CatalogLoaded) {
                        return ListView.builder(
                          padding: EdgeInsets.only(left: 24.w),
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: SizedBox(
                                height: 206.h,
                                width: 155.w,
                                child: DrugCard(
                                    drug: state.catalog.allItems()[index]),
                              ),
                            );
                          },
                        );
                      }
                      return const CustomText('An Error Occured', size: 15);
                    }),
                  ),
                  const YSpace(10)
                ],
              ),
            ),
          ),
          AddToCartButton(widget: widget)
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductView widget;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 414.w,
          height: 95.h,
          color: Colors.white,
          child: Center(
            child: BlocBuilder<CartBloc, CartState>(builder: (_, state) {
              return CustomFlatButton(
                onTap: () {
                  if (state is CartLoaded) {
                    int quantity = context.read<CounterCubit>().state;
                    context.read<CartBloc>().add(
                        CartItemAdded(CartModelItem(quantity, widget.drug)));
                  }
                  showAddToCartModal(context, widget.drug);
                },
                child: Builder(builder: (context) {
                  if (state is CartLoading) {
                    const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                      XSpace(10),
                      CustomText('Add to cart',
                          color: Colors.white,
                          size: 14,
                          weight: FontWeight.bold),
                    ],
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
