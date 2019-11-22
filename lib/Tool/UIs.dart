import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({this.colors,this.width,this.height,this.onPressed,this.borderRadius,@required this.child});

final List<Color> colors;
final double width;
final double height;
final Widget child;
final BorderRadius borderRadius;
final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark ?? theme.primaryColor];

    return  DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: _colors),borderRadius: borderRadius),
    child: Material(type: MaterialType.transparency,
    child: InkWell(
      splashColor: _colors.last,highlightColor: Colors.transparent,borderRadius: borderRadius,onTap: onPressed,
      child: ConstrainedBox(constraints: BoxConstraints.tightFor(height: height,width: width),
      child: Center(
        child: Padding(padding: const EdgeInsets.all(8.0),
        child: DefaultTextStyle(style: TextStyle(fontWeight: FontWeight.bold),child: child,),),
      ),),
    ),),);
  }
}

class GradientButtonRoute extends StatefulWidget {
  GradientButtonRoute({Key key}) : super(key: key);

  @override
  _GradientButtonRouteState createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
       child: Column(children: <Widget>[
         GradientButton(colors: [Colors.blue,Colors.red],height: 50,child: Text("I am s button"),onPressed: onTap,),
          GradientButton(colors: [Colors.green,Colors.green[700]],height: 50,child: Text("I am s button"),onPressed: onTap,),
           GradientButton(colors: [Colors.lightBlue,Colors.blueAccent],height: 50,child: Text("I am s button"),onPressed: onTap,)
       ],),
    );
  }

  onTap(){

  }
}