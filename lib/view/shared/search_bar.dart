import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required CatalogSearchBloc CatalogSearchBloc,
    required this.widget,
  })  : _CatalogSearchBloc = CatalogSearchBloc,
        super(key: key);

  final TopBar widget;

  final CatalogSearchBloc _CatalogSearchBloc;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.enableSearch,
      child: Row(
        children: [
          SizedBox(
            height: 36.h,
            width: (widget.textController?.text.isNotEmpty ?? false)
                ? 281.w
                : 356.w,
            child: TextField(
                controller: widget.textController,
                onChanged: (text) {
                  _CatalogSearchBloc.add(TextChanged(text: text));
                },
                style: const TextStyle(color: Colors.white),
                decoration: _inputDecoration),
          ),
          Visibility(
              visible: widget.textController?.text.isNotEmpty ?? false,
              child: Row(
                children: [
                  const XSpace(2),
                  TextButton(
                      onPressed: () {
                        _CatalogSearchBloc.add(const TextChanged(text: ''));
                        widget.textController?.clear();
                      },
                      child: const CustomText('Cancel',
                          size: 12, color: Colors.white))
                ],
              ))
        ],
      ),
    );
  }
}

var _inputDecoration = InputDecoration(
    contentPadding: EdgeInsets.zero,
    prefixIcon: const Icon(Icons.search, color: Colors.white, size: 15),
    fillColor: Colors.white24,
    filled: true,
    hintText: 'Search',
    hintStyle:
        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)));
