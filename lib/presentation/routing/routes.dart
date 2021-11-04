import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viralnewsapp/logic/cubit/loaddata_cubit.dart';
import 'package:viralnewsapp/model/grap_data.dart';
import 'package:viralnewsapp/presentation/screen/home_screen.dart';
import 'package:viralnewsapp/presentation/screen/reading_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    List<Articles> listofdata = [];
    int index = 0;
    LoaddataCubit loadingDataCubitinstance = LoaddataCubit(listofdata);
    final arg = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loadingDataCubitinstance,
            child: const HomeScreen(),
          ),
        );
      case '/Reading':
        return MaterialPageRoute(
          builder: (_) { 
            ReadingScreen? args = arg as ReadingScreen?;
            return BlocProvider.value(
            value: loadingDataCubitinstance,
            child: ReadingScreen(
              index: args!.index,
              listofdata: args.listofdata,
            ),
          );}
         
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: loadingDataCubitinstance,
            child: const HomeScreen(),
          ),
        );
    }
  }
}
