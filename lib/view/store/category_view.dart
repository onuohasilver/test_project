import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/all_categories_view.dart';
import 'package:drotest/view/store/bloc/category/category_bloc.dart';
import 'package:drotest/view/store/bloc/category/category_state.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  late CategoryBloc _CategoryBloc;
  @override
  void initState() {
    _CategoryBloc = context.read<CategoryBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: const TopBar(
            title: CustomText(
              'Categories',
              size: 22,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          preferredSize: Size(414.w, 171.h)),
      body: Column(children: [
        SectionHeader(
          title: 'CATEGORIES',
          buttonText: 'VIEW ALL',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllCategoriesView()));
          },
        ),
        const CategoryCardListSelector(),
        const YSpace(30),
        Expanded(
          flex: 5,
          child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
            if (state is CategoryStateLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: DroColors.purple));
            }
            if (state is CategoryStateSuccess) {
              return Column(
                children: [
                  SectionHeader(title: state.keyword),
                  DrugCardLists(listOfDrugs: state.items),
                ],
              );
            }
            return const NotFound();
          }),
        )
      ]),
    );
  }
}
