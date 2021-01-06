import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogWebviewPage extends StatefulWidget {
  String url;
  BlogWebviewPage({this.url});
  @override
  _BlogWebviewPageState createState() => _BlogWebviewPageState();
}

class _BlogWebviewPageState extends State<BlogWebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("web页面"),),
        body: Container(child: WebView(
        initialUrl: widget.url, 
        javascriptMode: JavascriptMode.unrestricted,
        
      )),
    );
  }
}