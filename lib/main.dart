import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/network/remote/dio_helper.dart';

void main() {
  runApp(const NewsApp());
  DioHelper.init();
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //this color for scaffold background color
        scaffoldBackgroundColor: Colors.white,
        //this color for the screen background color
        backgroundColor: Colors.white,
        //this customize for appBar
        appBarTheme: const AppBarTheme(
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
        ),
      ),
      home: const Scaffold(
        body: NewsLayout(),
      ),
    );
  }
}
