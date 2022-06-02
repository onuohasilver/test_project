import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/cart/bloc/cart_bloc.dart';
import 'package:drotest/view/cart/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key, required this.item}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
  final CartModelItem item;
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return DropdownButton(
        value: widget.item.quantity,
        onChanged: (int? value) {
          context
              .read<CartBloc>()
              .add(CartItemUpdated(widget.item.update(value ?? 0)));
        },
        items: List.generate(
            8,
            (index) => DropdownMenuItem(
                value: index + 1, child: Text('${index + 1}'))),
        icon:
            const Icon(Icons.arrow_drop_down_rounded, color: DroColors.purple),
      );
    });
  }
}
