// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:viralnewsapp/model/grap_data.dart';
import 'package:viralnewsapp/presentation/widgets/icon_widget.dart';
import 'package:viralnewsapp/presentation/widgets/list_img.dart';
import 'package:viralnewsapp/presentation/widgets/text_widget.dart';
import 'package:viralnewsapp/presentation/widgets/wsizedb.dart';

class ReadingScreen extends StatefulWidget {
  List<Articles> listofdata;
  int index;
  ReadingScreen({
    Key? key,
    required this.listofdata,
    required this.index,
  }) : super(key: key);

  @override
  _ReadingScreenState createState() =>
      _ReadingScreenState(this.listofdata, this.index);
}

class _ReadingScreenState extends State<ReadingScreen> {
  int index = 0;
  List<Articles> listofdata = [];

  _ReadingScreenState(this.listofdata, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 38, 39, 44),
          ),
          Column(
            children: [
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
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListImage(
                      imgurl: listofdata[index].urlToImage,
                      height: 0.4,
                      width: 0.9,
                      br: 'gf',
                    ),
                    WSizedBox(
                      hval: 0.02,
                      wval: 0,
                    ),
                    TextWidget(
                      txt: listofdata[index].description,
                      color: Colors.white,
                      size: 13,
                    ),
                    WSizedBox(
                      hval: 0.02,
                      wval: 0,
                    ),
                    TextWidget(
                      txt: 'continue reading this article at:',
                      color: Colors.white70,
                      size: 13,
                    ),
                    InkWell(
                      onTap: () async {
                        launch(listofdata[index].url);
                      },
                      child: TextWidget(
                        txt: listofdata[index].url,
                        color: Colors.blue,
                        size: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
