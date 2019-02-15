import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  Color _draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        DraggableWidget(offset: Offset(80.0, 80.0),
        widgetColor: Colors.tealAccent,),
        DraggableWidget(offset: Offset(180.0, 80.0),
        widgetColor: Colors.redAccent,),
        Center(child: DragTarget(onAccept: (Color color){
          _draggableColor = color;
        },
        builder: (context,candiddaeData,rejectedData){
          return Container(width: 200,height: 200,color: _draggableColor,);
        },),)
      ],),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  const DraggableWidget({Key key,this.offset,this.widgetColor}):super(key:key);
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      offset =widget.offset;  
    }
  @override
  Widget build(BuildContext context) {
    return Positioned(left: offset.dx,
    top: offset.dy,
    child: Draggable(
      data: widget.widgetColor,
      child: Container(width: 100,height: 100,color: widget.widgetColor),
      feedback: Container(width: 100,height: 100,color: widget.widgetColor.withOpacity(0.5),),
      onDraggableCanceled: (Velocity v,Offset o){
        setState(() {
                  this.offset = o;
                });
      },
    ),);
  }
}