import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/custom_text.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:drotest/view/store/bloc/category/category_bloc.dart';
import 'package:drotest/view/store/bloc/category/category_event.dart';
import 'package:drotest/view/store/category_view.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCardList extends StatelessWidget {
  const CategoryCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
        if (state is CatalogLoading) {
          return const Center(
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: DroColors.purple));
        }
        if (state is CatalogLoaded) {
          return SizedBox(
            height: 127.h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24.w),
              itemCount: state.catalog.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  data: state.catalog.categories[index],
                  onTap: () {
                    context.read<CategoryBloc>().add(CategoryChanged(
                        text: state.catalog.categories[index]['title']));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CategoryView(
                        category: state.catalog.categories[index]['title'],
                      );
                    }));
                  },
                );
              },
            ),
          );
        }
        return const CustomText('An error occured', size: 15);
      }),
    );
  }
}

class CategoryCardListSelector extends StatelessWidget {
  const CategoryCardListSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<CatalogBloc, CatalogState>(builder: (context, state) {
        if (state is CatalogLoading) {
          return const Center(
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: DroColors.purple));
        }
        if (state is CatalogLoaded) {
          return SizedBox(
            height: 127.h,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24.w),
              itemCount: state.catalog.categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return CategoryCard(
                  data: state.catalog.categories[index],
                  onTap: () {
                    print('234asdaasd' * 1212);
                    context.read<CategoryBloc>().add(CategoryChanged(
                        text: state.catalog.categories[index]['title']));
                  },
                );
              },
            ),
          );
        }
        return const CustomText('An error occured', size: 15);
      }),
    );
  }
}
