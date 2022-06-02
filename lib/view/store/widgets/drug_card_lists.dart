import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/store/models/item_model.dart';
import 'package:drotest/view/store/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrugCardLists extends StatelessWidget {
  const DrugCardLists(
      {Key? key,
      required ScrollController scrollController,
      required this.listOfDrugs})
      : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  final List<Item> listOfDrugs;
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
      width: 444.w,
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: GridView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24.h,
          childAspectRatio: (size.width * .21) / (size.height * .13),
          crossAxisSpacing: 24.w,
        ),
        itemCount: listOfDrugs.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return DrugCard(drug: listOfDrugs[index]);
        },
      ),
    );
  }
}

class SearchDrugCardLists extends StatelessWidget {
  const SearchDrugCardLists(
      {Key? key,
      required ScrollController scrollController,
      required this.listOfDrugs})
      : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  final List<Item> listOfDrugs;
  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);
    return Container(
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
        itemCount: listOfDrugs.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ExtendedDrugCard(drug: listOfDrugs[index]);
        },
      ),
    );
  }
}
