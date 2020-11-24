import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/Foundation/Reflect.dart';

const items = ["反射", "Provider"];

class FoundationMenuPage extends StatefulWidget {
  _FoundationMenuPageState createState() => _FoundationMenuPageState();
}

class _FoundationMenuPageState extends State<FoundationMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foundation"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              gotoPage(index, context);
            },
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }

  void gotoPage(int index, BuildContext context) {
    print(index);
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/foundation/reflect");
        break;
      case 1:
        // Navigator.of(context)
        //     .push(new CupertinoPageRoute(builder: (BuildContext context) {
        //   return ProviderPage();
        // }));
        showDialog(context: context,builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("你确实要删除文件"),
              actions: [
                FlatButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("取消")),
                FlatButton(onPressed: ()=> Navigator.of(context).pop(true), child: Text("删除")),
              ],
            );
        });
        break;

        break;
      default:
    }
  }
}
