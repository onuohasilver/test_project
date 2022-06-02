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
  _setScrollingState(ScrollNotification scrollInfo) async {
    setState(() {
      if (scrollInfo is ScrollStartNotification) {
        _switchFAB = true;
      }

      if (scrollInfo is ScrollEndNotification) {
        _switchFAB = false;
      }
    });
  }

  bool _switchFAB = true;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogSearchBloc, CatalogSearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              child: const TopBar(enableSearch: true, height: 171),
              preferredSize: Size(414.w, 171.h)),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: 800.h,
              child: Column(
                children: [
                  const LocationPinDisplay(),
                  Builder(builder: (context) {
                    if (state is SearchStateLoading) {
                      return const CircularProgressIndicator(
                          strokeWidth: 2, color: DroColors.purple);
                    }
                    if (state is SearchStateError) {
                      return Text(state.error);
                    }
                    if (state is SearchStateSuccess) {
                      return state.items.isEmpty
                          ? NotFound(keyWord: state.keyword)
                          : Expanded(
                              child: SearchDrugCardLists(
                                  scrollController: _scrollController,
                                  listOfDrugs: state.items));
                    }
                    return SizedBox(
                      height: 600.h,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionHeader(
                            title: 'CATEGORIES',
                            buttonText: 'VIEW ALL',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AllCategoriesView()));
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
                                  return const Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: DroColors.purple));
                                }
                                if (state is CatalogLoaded) {
                                  return DrugCardLists(
                                    scrollController: _scrollController,
                                    listOfDrugs: state.catalog.allItems(),
                                  );
                                }
                                return const NotFound();
                              }),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          floatingActionButton: CustomFab(_switchFAB),
          bottomNavigationBar: const CustomBottomBar(),
        );
      },
    );
  }
}
