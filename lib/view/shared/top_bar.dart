import 'package:drotest/utilities/utilities.dart';
import 'package:drotest/view/shared/shared.dart';
import 'package:drotest/view/store/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatefulWidget {
  const TopBar(
      {Key? key,
      this.enableSearch = false,
      this.height = 120,
      this.title = const SizedBox(),
      this.onChanged,
      this.leadingTap,
      this.icon = 'heart.svg',
      this.textController})
      : super(key: key);

  final bool enableSearch;
  final double height;
  final String icon;
  final Widget title;
  final Function(String)? onChanged;
  final Function()? leadingTap;
  final TextEditingController? textController;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  late CatalogSearchBloc _CatalogSearchBloc;

  @override
  void initState() {
    _CatalogSearchBloc = context.read<CatalogSearchBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeReference size = SizeReference(context);

    return Container(
      height: widget.height.h,
      width: 414.w,
      decoration: const BoxDecoration(
          gradient: DroColors.purpleGradient,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Image.asset('assets/twirl.png', fit: BoxFit.cover)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .07),
            child: Column(
              children: [
                const YSpace(66),
                Row(
                  children: [
                    Visibility(
                      visible: widget.leadingTap != null,
                      child: GestureDetector(
                          child: SvgPicture.asset('assets/Union.svg',
                              height: 25.w, width: 22.w, color: Colors.white),
                          onTap: widget.leadingTap),
                    ),
                    const XSpace(20),
                    widget.title,
                    const Spacer(),
                    SvgPicture.asset('assets/${widget.icon}',
                        height: 25.w, width: 22.w, color: Colors.white)
                  ],
                ),
                const YSpace(16),
                SearchBar(CatalogSearchBloc: _CatalogSearchBloc, widget: widget)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
