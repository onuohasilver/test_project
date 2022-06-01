import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/all_categories_view.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
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
    SizeReference size = SizeReference(context);
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
          Flexible(
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
          ),
          const YSpace(30),
          const SectionHeader(title: 'SUGGESTIONS'),
          Expanded(
            flex: 5,
            child: NotificationListener(
              onNotification: (ScrollNotification scrollInfo) {
                _setScrollingState(scrollInfo);
                return true;
              },
              child: Container(
                width: 444.w,
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: GridView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.h,
                    childAspectRatio: (size.width * .21) / (size.height * .13),
                    crossAxisSpacing: 24.w,
                  ),
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return const DrugCard();
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: CustomFab(_switchFAB),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
