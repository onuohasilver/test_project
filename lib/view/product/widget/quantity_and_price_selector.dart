import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/product/bloc/counter_bloc.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'floating_drug_price.dart';

class QuantityAndPriceSelector extends StatefulWidget {
  final int amount;
  final Item item;
  const QuantityAndPriceSelector(
      {Key? key, required this.amount, required this.item})
      : super(key: key);

  @override
  _QuantityAndPriceSelectorState createState() =>
      _QuantityAndPriceSelectorState();
}

class _QuantityAndPriceSelectorState extends State<QuantityAndPriceSelector> {
  late CounterCubit counterCubit;
  @override
  void initState() {
    counterCubit = context.read<CounterCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(Icons.remove, size: 24.h),
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      }),
                  CustomText('$state', size: 20, weight: FontWeight.bold),
                  IconButton(
                    icon: Icon(Icons.add, size: 24.h),
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                  )
                ],
              ),
            ),
            const XSpace(15),
            const CustomText(
              'Pack(s)',
              size: 14,
              color: Colors.grey,
            ),
            const Spacer(),
            FloatingDrugPrice(amount: state * widget.item.price),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    counterCubit.reset();
    super.dispose();
  }
}
