import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/Model/entity/banner.dart';
import 'package:flutter_demo/Project/Blog/Model/state/app.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  static final _bodyKey = GlobalKey<_HomeBlogPageState>();

  HomePage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel(banners: store.state.home.banners),
      builder: (context, vm) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ZOE Blog"),
          actions: [IconButton(icon: Icon(Icons.search), onPressed: null)],
          leading: Builder(builder: (context) {
            return IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
        ),
        drawer: LeftMenu(),
        body: HomeBlogPage(
          key: _bodyKey,
          store: StoreProvider.of<AppState>(context),
          vm: vm,
        ),
      ),
    );
  }
}

class HomeBlogPage extends StatefulWidget {
  final Store<AppState> store;
  final _ViewModel vm;
  HomeBlogPage({Key key, @required this.store, @required this.vm})
      : super(key: key);

  @override
  _HomeBlogPageState createState() => _HomeBlogPageState();
}

class _HomeBlogPageState extends State<HomeBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("我是内容"),
    );
  }
}

class _ViewModel {
  final List<BannerInfo> banners;
  _ViewModel({
    @required this.banners,
  });
}

class LeftMenu extends StatelessWidget {
  const LeftMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Image.asset(
                      "Images/1.jpg",
                      width: 80,
                    ),
                  ),
                  Text(
                    "data",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add Count"),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Manage Account"),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
