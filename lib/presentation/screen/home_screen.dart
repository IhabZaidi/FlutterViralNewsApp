// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viralnewsapp/logic/cubit/loaddata_cubit.dart';
import 'package:viralnewsapp/model/grap_data.dart';
import 'package:viralnewsapp/presentation/widgets/bloc_widget.dart';
import 'package:viralnewsapp/presentation/widgets/icon_widget.dart';
import 'package:viralnewsapp/presentation/widgets/text_widget.dart';
import 'package:viralnewsapp/presentation/widgets/wsizedb.dart';

// ignore_for_file: prefer_const_constructors
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Articles> listdata = [];
  String concat = 'sports';
  void changeTabcontroller() {
    if (tabController.index == 0) {
      setState(() {
        BlocFutureWidget(
          concat: 'health',
        );
      });
    } else if (tabController.index == 1) {
      BlocProvider.of<LoaddataCubit>(context).emitLoading();
      BlocProvider.of<LoaddataCubit>(context).loadNews('health');
    } else if (tabController.index == 2) {
      BlocProvider.of<LoaddataCubit>(context).emitLoading();
      BlocProvider.of<LoaddataCubit>(context).loadNews('finance');
    } else {
      BlocProvider.of<LoaddataCubit>(context).emitLoading();
      BlocProvider.of<LoaddataCubit>(context).loadNews('tech');
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      changeTabcontroller();
      log(tabController.index.toString());
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 38, 39, 44),
          ),
          DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              children: <Widget>[
                WSizedBox(
                  hval: 0.03,
                  wval: 0,
                ),
                Row(
                  children: [
                    WSizedBox(
                      hval: 0,
                      wval: 0.05,
                    ),
                    TextWidget(txt: "VIRAL.app", color: Colors.white, size: 14),
                    IconWidget(
                      icon: Icons.dialpad,
                      size: 15,
                      iconColor: Colors.white70,
                    ),
                    WSizedBox(
                      hval: 0,
                      wval: 0.47,
                    ),
                    IconWidget(
                      icon: Icons.settings,
                      size: 15,
                      iconColor: Colors.white70,
                    ),
                  ],
                ),
                Container(
                  constraints: BoxConstraints.expand(height: 25),
                  child: TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(text: "Sport"),
                      Tab(text: "Health"),
                      Tab(text: "Finance"),
                      Tab(text: "Tech"),
                    ],
                    indicatorColor: Colors.red,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      BlocFutureWidget(
                        concat: 'sports',
                      ),
                      BlocFutureWidget(
                        concat: 'health',
                      ),
                      BlocFutureWidget(
                        concat: 'market',
                      ),
                      BlocFutureWidget(
                        concat: 'tech',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
