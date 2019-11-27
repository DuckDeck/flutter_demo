

import 'package:flutter/material.dart';
class ScaleAnimationRoute extends StatefulWidget {
  @override

  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}


class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  Animation<double> fadeAnimation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3),vsync: this);
    //animation = CurvedAnimation(parent: controller,curve: Curves.easeInOut);
    animation = Tween(begin: 0.3,end: 1.0).animate(controller)..addListener((){
      setState(()=>{});
    });
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }

    });
    controller.forward();
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: AnimatedBuilder(animation: animation,child: Image.asset("Images/1.jpg"), builder: (BuildContext ctx,Widget child){
  //       return Center(child: Container(height: animation.value,width: animation.value,child: child,));
  //     },)
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    //return GrowTransition(child: Image.asset("Images/1.jpg"),animation: animation,);
    return FadeTransition(child: Image.asset("Images/1.jpg"),opacity: animation,);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key,Animation<double> animation}):super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(child: Image.asset("Images/1.jpg",width:animation.value,height:animation.value),);
  }
}
//原来是系统自带的，我写错了
// class ANimationBuilder extends AnimatedWidget {
//   final Widget child;
//   final Widget Function(BuildContext ctx,Widget child) builder;
//   ANimationBuilder({Key key,Animation<double> animation,this.child,this.builder}):super(key:key,listenable:animation);
//   @override
//   Widget build(BuildContext context) {
//     // final Animation<double> animation = listenable;
//    //自己写了个不知道行不行
//     return builder(context,child);
//   }
// }

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const GrowTransition({Key key,this.child, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: AnimatedBuilder(animation: animation,child: child,builder:(BuildContext ctx,Widget child){
      return Container(height: animation.value,width: animation.value,child: child,);
    } ,),);
  }
}


class HeroAnimationRoute extends StatelessWidget {
  const HeroAnimationRoute({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      alignment: Alignment.topCenter,
      child: Material(
        child: InkWell(child: 
      Hero(tag: "avatar",child: ClipOval(child: Image.asset("Images/head1.jpg",width:100),),),
      onTap: (){
        Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context,Animation animation,Animation secondaryAnimation){
          return FadeTransition(opacity: animation,child: Scaffold(appBar: AppBar(title: Text("原图")),body: HeroAnimationRouteB(),));
        }));
      },)
      )
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(tag: "avatar",child: Image.asset("Images/head1.jpg"),),
    );
  }
}


class StaggerAnimation extends StatelessWidget {
   StaggerAnimation({Key key,this.controller}) : super(key: key){
     height = Tween<double>(begin: .0,end: 300.0).animate(CurvedAnimation(curve: Interval(0.0, 0.6,curve: Curves.ease),parent: controller));
     color = ColorTween(begin: Colors.green,end: Colors.red).animate(CurvedAnimation(curve: Interval(0.0, 0.6,curve: Curves.ease),parent: controller));
     padding = Tween<EdgeInsets>(begin: EdgeInsets.only(left: .0),end: EdgeInsets.only(left: 100.0)).animate(CurvedAnimation(parent: controller,curve: Interval(0.6, 1.0,curve: Curves.ease)));
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context,Widget child){
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(builder: _buildAnimation,animation: controller,);
  }


}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin{
  AnimationController _controller;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 2000),vsync: this);
  }

  Future<Null> _playAnimation() async{
    try{
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled{
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        _playAnimation();
      },
      child: Center(child: 
        Container(width: 300.0,height: 300.0, decoration: BoxDecoration(color: Colors.red.withOpacity(0.5),
        border: Border.all(color: Colors.black.withOpacity(0.5))),
        child: StaggerAnimation(controller: _controller,),
        ),),
    );
  }

}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}):super(key:key);
  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child,Animation<double> animation){
            var tween = Tween<Offset>(begin: Offset(1,0),end: Offset(0,0));
            //return ScaleTransition(child: child,scale: animation,); //大小变化的动画
            //return SlideTransition(child: child,position: tween.animate(animation),); //左右移动的动画，但是有问题
            //return CustomSlideTransition(child: child,position: tween.animate(animation),); //用了自定义的动画，看起来好了很多
            return SlideTransitionX(child: child,direction: AxisDirection.down,position: animation,); //从上往下的
          },
          child: Text('$_count',key: ValueKey<int>(_count)),
          ),
          RaisedButton(child: const Text("+1"),onPressed: (){
            setState(() {
              _count += 1;
            });
          },)
        ],
      ),
    );
  }
}

class CustomSlideTransition extends AnimatedWidget {
  final bool transformHitTests;
  final Widget child;
  CustomSlideTransition({Key key,@required Animation<Offset> position,this.transformHitTests = true,this.child}) : assert(position != null) ,super(key:key,listenable:position);

  Animation<Offset> get position =>listenable;
  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if(position.status == AnimationStatus.reverse){
      offset = Offset(-offset.dx,offset.dy);
    }
    return FractionalTranslation(translation: offset,transformHitTests: transformHitTests,child: child,);
  }
}


class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({Key key,@required Animation<double> position,this.transformHitTests = true,this.direction = AxisDirection.down,this.child}) 
  :assert(position != null),super(key:key,listenable:position){
    switch(direction){
      case AxisDirection.up:
      _tween = Tween(begin: Offset(0,1),end: Offset(0, 0));
      break;
      case AxisDirection.right:
      _tween = Tween(begin: Offset(-1,0),end: Offset(0, 0));
      break;
      case AxisDirection.down:
      _tween = Tween(begin: Offset(0,-1),end: Offset(0, 0));
      break;
      case AxisDirection.left:
      _tween = Tween(begin: Offset(1,0),end: Offset(0, 0));
      break;
    }
  }
   final bool transformHitTests;
  Animation<double> get position =>listenable;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> _tween;
  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if(position.status == AnimationStatus.reverse){
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy) ;
          break;
          case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy) ;
          break;
          case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy) ;
          break;
          case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy) ;
          break;
        default:
      }
    }
    return FractionalTranslation(translation: offset,transformHitTests: transformHitTests,child: child,);
  }
  
}


//这个有问题目前还不能解决
class AnimatedDecoratedBox extends  ImplicitlyAnimatedWidget{ 

 AnimatedDecoratedBox({Key key,@required this.decoration,this.child, Curve curve = Curves.linear,@required Duration duration,Duration reverseDuration})
 :super(key:key,curve:curve,duration:duration);
 final BoxDecoration decoration;
 final Widget child;

  @override
  _AnimatedDecoratedBox createState() {
   
    return _AnimatedDecoratedBox();
  }
}

class _AnimatedDecoratedBox extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration;
  @override
  Widget build(BuildContext context) {
    print(_decoration);
    return DecoratedBox(decoration: _decoration.evaluate(animation),child: widget.child,);
  }

  @override
  void forEachTween(visitor) {
    print("forEachTween");
    print(visitor);
    print(_decoration);
   _decoration = visitor(_decoration,widget.decoration,(value)=>DecorationTween(begin: value));
   print("print(_decoration);");
   print(_decoration);
   //调用 visitor 方法还是null
  }

}