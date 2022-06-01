import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Scaffold(
      appBar: PreferredSize(
        child: const TopBar(),
        preferredSize: Size(414.w, 171.h),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const YSpace(30),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                mainAxisSpacing: 26.h,
                childAspectRatio: (size.width * .4) / (size.height * .13),
                children: [..._categories.map((e) => const CategoryCard())],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> _categories = ['Headache', 'Supplements', 'Infants', 'Cough'];
