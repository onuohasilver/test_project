import 'package:drotest/view/store/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: ((context, child) {
        return MaterialApp(
          home: const StoreView(),
          theme: ThemeData(
            fontFamily: 'Proxima',
            primarySwatch: Colors.blue,
          ),
        );
      }),
    );
  }
}
