import 'package:flutter/material.dart';

class MainImageList extends StatefulWidget {
  @override
  _MainImageListState createState() => _MainImageListState();
}

class _MainImageListState extends State<MainImageList> {
  PageController controller ;
  var imgs = [Image.asset("Images/head1.jpg"),
  Image.asset("Images/head2.jpg"),
  Image.asset("Images/head3.jpg"),
  Image.asset("Images/head3.jpg"),];
 @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 4);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("美图"),),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemBuilder: (context,index){
          return imgs[index];
        },
        itemCount: imgs.length,
      )
        
    );
  }
}