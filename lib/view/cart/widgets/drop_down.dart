import 'package:drotest/utilities/utilities.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: 20,
      onChanged: (int? value) {},
      items: List.generate(
          20,
          (index) =>
              DropdownMenuItem(value: index + 1, child: Text('${index + 1}'))),
      icon: const Icon(Icons.arrow_drop_down_rounded, color: DroColors.purple),
    );
  }
}
