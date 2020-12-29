import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogLoginPage extends StatefulWidget {
  @override
  _BlogLoginPageState createState() => _BlogLoginPageState();
}

class _BlogLoginPageState extends State<BlogLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center, children: [
        
        CachedNetworkImage(
          imageUrl:
              "http://pic.netbian.com/uploads/allimg/201222/001204-1608567124c15d.jpg",
          fit: BoxFit.cover,
          width: 300,
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(child: Text(" "), width: 360, height: 200),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          top: 30,
          child: GestureDetector(
          child: IconButton(icon: Icon(Icons.arrow_back),),
        )),
      ]),
    );
  }
}
