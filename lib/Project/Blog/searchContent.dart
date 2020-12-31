import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/ArticleInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/SortInfo.dart';
import 'package:flutter_demo/Project/Blog/Model/UserInfo.dart';
//这个有点麻烦先不写了
class SearchBarDelegate extends SearchDelegate<String> {
  SearchResult searchResult;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
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
    return FutureBuilder<SearchResult>(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return  TabBarView(children: createTab(snapshot.data));
          }
        });
  }

  List<Tab> createTab(SearchResult searchResult){
    final tabs = List<Tab>();
    
    return tabs;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  Future<SearchResult> _getData() async {
    final articleResult = await ArticleInfo.searchArticle(query, 0);
    final userResult = await UserInfo.searchUser(query, 0);
    final result = SearchResult();
    result.articles = articleResult.data as List<ArticleInfo>;
    result.userinfos = userResult.data as List<UserInfo>;
    return result;
  }
}

class SearchResult {
  List<UserInfo> userinfos;
  List<ArticleInfo> articles;
  List<SortInfo> sorts;
}
