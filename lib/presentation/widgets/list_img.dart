// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListImage extends StatelessWidget {
  final String imgurl;
  final double height;
  final double width;
  String? br;

   ListImage({
    Key? key,
    required this.imgurl,
    required this.height,
    required this.width,
    this.br,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
        borderRadius:  br != null ? BorderRadius.circular(8) : BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
        image: DecorationImage(
          image: NetworkImage(imgurl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
