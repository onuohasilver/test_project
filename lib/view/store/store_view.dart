import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/all_categories_view.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreView extends StatefulWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  _setScrollingState(ScrollNotification scrollInfo) {
    setState(() {
      if (scrollInfo.metrics.pixels > 0.0) {
        _switchFAB = true;
      } else {
        _switchFAB = false;
      }
    });
  }

  bool _switchFAB = true;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: const TopBar(enableSearch: true, height: 171),
          preferredSize: Size(414.w, 171.h)),
      body: Column(
        children: [
          const LocationPinDisplay(),
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
          const CategoryCardList(),
          const YSpace(30),
          const SectionHeader(title: 'SUGGESTIONS'),
          Expanded(
            flex: 5,
            child: NotificationListener(
              onNotification: (ScrollNotification scrollInfo) {
                _setScrollingState(scrollInfo);
                return true;
              },
              child: BlocBuilder<CatalogBloc, CatalogState>(
                  builder: (context, state) {
                if (state is CatalogLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CatalogLoaded) {
                  print(state.catalog.items);
                  return DrugCardLists(
                    scrollController: _scrollController,
                    listOfDrugs: state.catalog.getByName(''),
                  );
                }
                return const NotFound();
              }),
            ),
          )
        ],
      ),
      floatingActionButton: CustomFab(_switchFAB),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
