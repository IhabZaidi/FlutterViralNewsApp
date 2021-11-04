// ignore_for_file: prefer_const_constructors, no_logic_in_create_state, sized_box_for_whitespace
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viralnewsapp/logic/cubit/loaddata_cubit.dart';
import 'package:viralnewsapp/presentation/screen/reading_screen.dart';
import 'package:viralnewsapp/presentation/widgets/icon_widget.dart';
import 'package:viralnewsapp/presentation/widgets/list_img.dart';
import 'package:viralnewsapp/presentation/widgets/text_widget.dart';
import 'package:viralnewsapp/presentation/widgets/wsizedb.dart';

class BlocFutureWidget extends StatefulWidget {
  final String concat;
  const BlocFutureWidget({
    Key? key,
    required this.concat,
  }) : super(key: key);

  @override
  _BlocFutureWidgetState createState() => _BlocFutureWidgetState(concat);
}

class _BlocFutureWidgetState extends State<BlocFutureWidget> {
  final String concat;
  _BlocFutureWidgetState(this.concat);
  @override
  void initState() {
    print(concat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoaddataCubit, LoaddataState>(
      builder: (context, state) {
        BlocProvider.of<LoaddataCubit>(context).loadNews(concat);
        if (state is LoaddataLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WSizedBox(
                hval: 0.02,
                wval: 0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  itemCount: BlocProvider.of<LoaddataCubit>(context)
                          .listofdata
                          .length -
                      5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        WSizedBox(
                          hval: 0,
                          wval: 0.05,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              ListImage(
                                imgurl: BlocProvider.of<LoaddataCubit>(context)
                                    .listofdata[index + 5]
                                    .urlToImage,
                                height: 0.28,
                                width: 0.65,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
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
                  TextWidget(txt: "Recent News", color: Colors.white, size: 14),
                ],
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: ListView.builder(
                    itemCount: BlocProvider.of<LoaddataCubit>(context)
                        .listofdata
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/Reading', arguments: ReadingScreen(listofdata: BlocProvider.of<LoaddataCubit>(
                                                context)
                                            .listofdata, index: index));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(255, 41, 44, 53),
                                  ),
                                  child: Row(
                                    children: [
                                      ListImage(
                                        imgurl: BlocProvider.of<LoaddataCubit>(
                                                context)
                                            .listofdata[index]
                                            .urlToImage,
                                        height: 0.28,
                                        width: 0.3,
                                      ),
                                      Column(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      TextWidget(
                                        txt: BlocProvider.of<LoaddataCubit>(
                                                        context)
                                                    .listofdata[index]
                                                    .title
                                                    .toString()
                                                    .length >
                                                30
                                            ? '${BlocProvider.of<LoaddataCubit>(context).listofdata[index].title.toString().substring(0, 30)} ...'
                                            : BlocProvider.of<LoaddataCubit>(
                                                    context)
                                                .listofdata[index]
                                                .title,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconWidget(
                                            icon: Icons.person,
                                            size: 12,
                                            iconColor: Colors.white70,
                                          ),
                                          Expanded(
                                            child: TextWidget(
                                              txt:
                                                  'Author: ${BlocProvider.of<LoaddataCubit>(context).listofdata[index].author == null ? 'Unknow' : BlocProvider.of<LoaddataCubit>(context).listofdata[index].author.toString().length > 25 ? BlocProvider.of<LoaddataCubit>(context).listofdata[index].author.toString().substring(0, 25) : BlocProvider.of<LoaddataCubit>(context).listofdata[index].author}',
                                              color: Colors.white70,
                                              size: 8,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconWidget(
                                            icon: Icons.timelapse,
                                            size: 12,
                                            iconColor: Colors.white70,
                                          ),
                                          TextWidget(
                                            txt:
                                                'Puplished at : ${BlocProvider.of<LoaddataCubit>(context).listofdata[index].publishedAt.toString().replaceAll('T', ' ').replaceAll('Z', ' ')}',
                                            color: Colors.white70,
                                            size: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WSizedBox(
                            hval: 0.02,
                            wval: 0,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        log(BlocProvider.of<LoaddataCubit>(context)
            .listofdata
            .length
            .toString());
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
