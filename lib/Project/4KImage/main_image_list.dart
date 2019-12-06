import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MainImageList extends StatefulWidget {
  @override
  _MainImageListState createState() => _MainImageListState();
}

class _MainImageListState extends State<MainImageList>  with SingleTickerProviderStateMixin {
  PageController controller;
  TabController tabController;
  var imgs = [
    Image.asset("Images/head1.jpg"),
    Image.asset("Images/head2.jpg"),
    Image.asset("Images/head3.jpg"),
    Image.asset("Images/head3.jpg"),
  ];
  var tabs = [Tab(text: "123",),Tab(text: "123",),Tab(text: "123",),Tab(text: "123",)];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 4);
    tabController = TabController(length: 4,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return Container(
      child:  TabBarView(
            controller: tabController,
            children: tabs.map((Tab tab) {
            return Center(
              child: new Text(tab.text),
            );
          }).toList()),
    );
  }
}


// Column(
//         children: <Widget>[
//           TabBarView(
            
//             controller: tabController,
//             children: tabs.map((Tab tab) {
//             return Center(
//               child: new Text("内容："+tab.text),
//             );
//           }).toList()),
//           Container(
//             height: ScreenUtil.getInstance().setHeight(1234),
//             child: PageView.builder(
//             scrollDirection: Axis.horizontal,
//             controller: controller,
//             itemBuilder: (context, index) {
//               return imgs[index];
//             },
//             itemCount: imgs.length,
//           ),
//           )
//         ],
//       ),