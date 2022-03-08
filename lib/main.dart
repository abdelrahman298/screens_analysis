import 'package:screens_analysis/layout/cubit/home_cubit.dart';
import 'package:screens_analysis/layout/cubit/home_state.dart';
import 'package:screens_analysis/layout/home_layout.dart';
import 'package:screens_analysis/module/numeric_metrics/numeric_screen.dart';
import 'package:screens_analysis/module/on_boarding/on_boarding_screen.dart';
import 'package:screens_analysis/shared/bloc_observer.dart';
import 'package:screens_analysis/shared/network/local/cache_helper.dart';
import 'package:screens_analysis/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget? startWidget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  if (onBoarding != null) {
    startWidget = OnBoardingScreen();
  } else {
    startWidget = const HomeLayout();
  }

  BlocOverrides.runZoned(
        () {
      runApp(MyApp(startWidget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp(this.startWidget);

  final startWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getProductData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme: lightTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}
