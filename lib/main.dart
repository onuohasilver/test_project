import 'package:drotest/bloc/bloc_observer.dart';
import 'package:drotest/view/store/bloc/search_bloc.dart';
import 'package:drotest/view/store/store_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'repository/store_repository.dart';
import 'view/store/bloc/catalog_bloc.dart';

void main() async {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: DrotestBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: ((context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) =>
                    CatalogBloc(shoppingRepository: StoreRepository())
                      ..add(CatalogStarted())),
            BlocProvider(
                create: (_) =>
                    GithubSearchBloc(githubRepository: StoreRepository())),
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'Proxima', primarySwatch: Colors.blue),
            home: const StoreView(),
          ),
        );
      }),
    );
  }
}
