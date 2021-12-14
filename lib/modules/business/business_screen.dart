import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components_screen.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, states) {
          var list = NewsCubit.get(context).business;
          if (states is! NewsGetBusinessLoadingStates) {
            return ListView.separated(
                //this 4 active scroll for screen
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildArticleItem(list[index]);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 1.0,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  );
                },
                itemCount: 10);
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.deepOrange,
              backgroundColor: Colors.black,
            ));
          }
        },
        listener: (context, states) {});
  }
}
