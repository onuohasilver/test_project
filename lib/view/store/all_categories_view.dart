import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:drotest/view/store/category_view.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
        if (state is CatalogLoading) {
          return const Center(
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: DroColors.purple));
        }
        if (state is CatalogLoaded) {
          return Padding(
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
                    children: [
                      ...state.catalog.categories.map((e) => CategoryCard(
                          data: e,
                          onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CategoryView(
                                  category: e['title'],
                                );
                              }))))
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const NotFound();
      }),
    );
  }
}
