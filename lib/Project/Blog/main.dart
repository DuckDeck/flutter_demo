import 'package:flutter/material.dart';
import 'package:flutter_demo/Project/Blog/app.dart';
import 'package:flutter_demo/Project/Blog/config.dart';
import 'package:flutter_demo/Project/Blog/factory.dart';
import 'package:package_info/package_info.dart';



class ZoeBlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
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
