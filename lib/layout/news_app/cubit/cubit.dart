import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/sciences/sciences_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/remote/cache_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;
  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      fromShared = isDark;
      emit(NewsAppChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark)
          .then((value) => emit(NewsAppChangeModeStates()));
    }
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Sciences',
    ),
  ];

//this method for change location in bottom nav bar
  void changeBottomNavBar(int index) {
    if (index == 0) {
      getBusiness();
    }

    if (index == 1) {
      getSports();
    }
    if (index == 2) {
      getSciences();
    }
    currentIndex = index;
    emit(NewsBottomNavStates());
  }

  //list for screens
  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const SciencesScreen(),
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> sciences = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingStates());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '7d029239320b4803af87e4104ce88036',
      },
    ).then((value) {
      business = value.data['articles'];
      if (kDebugMode) {
        print(business[0]['title']);
      }
      emit(NewsGetBusinessDataSuccessStates());
    }).catchError((onError) {
      if (kDebugMode) {
        print('$onError error when the get data');
      }
      emit(NewsGetBusinessDataErrorStates(onError.toString()));
    });
  }

  void getSports() {
    if (sports.isEmpty) {
      emit(NewsGetSportsLoadingStates());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '7d029239320b4803af87e4104ce88036',
        },
      ).then((value) {
        sports = value.data['articles'];
        if (kDebugMode) {
          print(sports[0]['title']);
        }
        emit(NewsGetBusinessDataSuccessStates());
      }).catchError((onError) {
        if (kDebugMode) {
          print('$onError error when the get data');
        }
        emit(NewsGetSportsDataErrorStates(onError.toString()));
      });
    } else {
      emit(NewsGetBusinessDataSuccessStates());
    }
  }

  void getSciences() {
    if (sciences.isEmpty) {
      emit(NewsGetSciencesLoadingStates());
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '7d029239320b4803af87e4104ce88036',
        },
      ).then((value) {
        sciences = value.data['articles'];
        if (kDebugMode) {
          print(sciences[0]['title']);
        }
        emit(NewsGetSciencesDataSuccessStates());
      }).catchError((onError) {
        if (kDebugMode) {
          print('$onError error when the get data');
        }
        emit(NewsGetSportsDataErrorStates(onError.toString()));
      });
    } else {
      emit(NewsGetSciencesDataSuccessStates());
    }
  }
}
