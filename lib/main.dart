import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/network/remote/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

import 'layout/news_app/news_layout.dart';

//void main() {

void main() async {
  //لضمان تنفيذ ال async
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool? isDark;
  NewsApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, states) {
          var cubit = NewsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              //this color for scaffold background color
              scaffoldBackgroundColor: Colors.white,
              //this color for the screen background color
              backgroundColor: Colors.white,
              //this customize for appBar
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                actionsIconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  //this color for the top of the device screen ==> status bar
                  statusBarColor: Colors.white,
                  //this for brightness
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              primarySwatch: Colors.deepOrange,
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              //this color for scaffold background color
              scaffoldBackgroundColor: const Color(0xFF333739),
              //this color for the screen background color
              backgroundColor: Colors.white,
              //this customize for appBar
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                actionsIconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color(0xFF333739),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  //this color for the top of the device screen ==> status bar
                  statusBarColor: Color(0xFF333739),
                  //this for brightness
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
                unselectedItemColor: Colors.grey,
                backgroundColor: Color(0xFF333739),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const Scaffold(
              body: NewsLayout(),
            ),
          );
        },
        listener: (context, states) {},
      ),
    );
  }
}
