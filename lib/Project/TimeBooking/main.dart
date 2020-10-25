import 'package:flutter/material.dart';


class TimeBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class TimeCarvingPage extends StatefulWidget {
  TimeCarvingPage({Key key}) : super(key: key);

  @override
  _TimeCarvingPageState createState() => _TimeCarvingPageState();
}

class _TimeCarvingPageState extends State<TimeCarvingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("TimeCarving"),),
       body: Center(child: 
       Container(
         margin: EdgeInsets.all(10),
         
         child: Card(
           child: Column(
             children: [
               Container(
                
                 child: rightColumn,
               ),
               mainImage
             ],
           ),
         ),
       ),),
    );
  }

  final rightColumn = Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
    child: Column(children: [
      Container(padding: EdgeInsets.all(20),
         child: Text("组装一台小巧的8盘位万兆NAS，参考翼王使用永擎C236主板，E3是否还值得下手？",style: TextStyle(fontWeight: FontWeight.w800,letterSpacing: 0.5,fontSize: 20),),),
         Text('''其实比之前组装的分形工艺R5机箱要小很多很多了，对比一个8盘位的NAS机箱，可以看到也就大一点点而已，但是空间和散热都要好很多：用120元的廉价主板，组装一台高性能8盘位NAS，阵列卡+万兆网卡，M-atx机箱！''',textAlign: TextAlign.left,style: TextStyle(fontFamily: "Georgia",fontSize: 15),),
          Container(padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star,color:Colors.black),
                Icon(Icons.star,color:Colors.black),
                Icon(Icons.star,color:Colors.black),
                Icon(Icons.star,color:Colors.black),
                Icon(Icons.star_border_outlined,color:Colors.black),
              ],),
              Text("1110 Reviews",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800,fontFamily: "Roboto",letterSpacing: 0.5,fontSize: 20),)
            ],),),
    ],),
  );


  final mainImage = Image.asset('Images/1.jpg',fit: BoxFit.cover,);

}