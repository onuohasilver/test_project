import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 127.h,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 24.w),
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return const CategoryCard();
          },
        ),
      ),
    );
  }
}
