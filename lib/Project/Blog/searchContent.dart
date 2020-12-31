import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';


class SearchBarDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context){
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
      ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
     
    );
  }
   @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  
}

class searchResult{
  List<UserInfo> userinfos;
  List<ArticleInfo> articles;
  
}