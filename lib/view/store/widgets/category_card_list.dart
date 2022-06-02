import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/custom_text.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
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
    this.onTap,
  }) : super(key: key);
  final Function? onTap;

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
                  onTap: onTap,
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
