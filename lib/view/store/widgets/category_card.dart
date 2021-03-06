import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.data, this.onTap})
      : super(key: key);
  final Map data;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.43.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade100),
          height: 99.h,
          width: 126.w,
          child: Stack(
            children: [
              Center(
                child: Image.asset(data['imageUrl'],
                    fit: BoxFit.cover, height: 99.h, width: 126.w),
              ),
              Material(
                color: Colors.black54,
                child: InkWell(
                    child: Center(
                      child: CustomText(
                        data['title'],
                        size: 14.46,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                    onTap: onTap 
                        ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
