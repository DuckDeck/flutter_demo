import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
    appBar: AppBar(title: Text("First Page",style: TextStyle(fontSize: 36.0),),),
    body: Center(child: MaterialButton(
      child: Icon(Icons.navigate_next,color: Colors.white,size: 64.0,),
      onPressed: (){
        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext conext){
        //   return SecondPage();
        // }));
        Navigator.of(context).push(SlideTransitionRoute(SecondPage()));
      },
    ),),
    );
    
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.pinkAccent,
    appBar: AppBar(title: Text("Second Page",style: TextStyle(fontSize: 36.0),),
    backgroundColor: Colors.pinkAccent,
    leading: Container(),
    elevation: 0.0,),
    body: Center(child: MaterialButton(child: Icon(Icons.navigate_before,color: Colors.white,size: 64,),
    onPressed: (){
      Navigator.of(context).pop();
    },),),
    );
  }
}


class FadeTransitionRoute extends PageRouteBuilder{
  final Widget widget;
  FadeTransitionRoute(this.widget):super(transitionDuration:const Duration(seconds: 1),
  pageBuilder:(BuildContext context,Animation animation1,Animation animation2){
    return widget;
  },
  transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            return FadeTransition(
              opacity: Tween(begin:0.0,end :1.0).animate(CurvedAnimation(
                  parent:animation1,
                  curve:Curves.fastOutSlowIn
              )),
              child: child,
            );
        }  );
}

class ScaleTransitionRoute extends PageRouteBuilder{
  final Widget widget;
  ScaleTransitionRoute(this.widget):super(transitionDuration:const Duration(seconds: 1),
  pageBuilder:(BuildContext context,Animation animation1,Animation animation2){
    return widget;
  },
  transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            return ScaleTransition(
              scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn
              )),
              child: child,
            );
        }  );
}

class RotationTransitionRoute extends PageRouteBuilder{
  final Widget widget;
  RotationTransitionRoute(this.widget):super(transitionDuration:const Duration(seconds: 1),
  pageBuilder:(BuildContext context,Animation animation1,Animation animation2){
    return widget;
  },
  transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
             return RotationTransition(turns: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animation1,curve: Curves.fastOutSlowIn)),
             child: ScaleTransition(scale: Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: animation1,curve: Curves.fastOutSlowIn)),
             child: child,),
             );
        }  );
}

class SlideTransitionRoute extends PageRouteBuilder{
  final Widget widget;
  SlideTransitionRoute(this.widget):super(transitionDuration:const Duration(seconds: 1),
  pageBuilder:(BuildContext context,Animation animation1,Animation animation2){
    return widget;
  },
  transitionsBuilder:(
          BuildContext context,
          Animation<double> animation1,
          Animation<double> animation2,
          Widget child){
            return SlideTransition(position: 
            Tween<Offset>(begin: Offset(1.0, 0.0),end: Offset(0.0, 0.0)).animate(CurvedAnimation(parent: animation1,curve: Curves.easeInOutCirc)),
            child: child,);
        }  );
}



