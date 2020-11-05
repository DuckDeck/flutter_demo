import 'package:flutter/material.dart';
import 'dart:math';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {this.colors,
      this.width,
      this.height,
      this.onPressed,
      this.borderRadius,
      @required this.child});

  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;
  final BorderRadius borderRadius;
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.blue, Colors.red],
            height: 100,
            child: Image.asset("Images/1.jpg"),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.green, Colors.green[700]],
            height: 50,
            child: Text("I am s button"),
            onPressed: onTap,
          ),
          GradientButton(
            colors: [Colors.lightBlue, Colors.blueAccent],
            height: 50,
            child: Text("I am s button"),
            onPressed: onTap,
          )
        ],
      ),
    );
  }

  onTap() {}
}

class TurnBox extends StatefulWidget {
  const TurnBox({Key key, this.turns = .0, this.speed = 200, this.child})
      : super(key: key);
  final double turns;
  final int speed;
  final Widget child;
  @override
  State<StatefulWidget> createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TurbBox"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(
                Icons.add,
                size: 150,
                color: Colors.blue,
              ),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 150,
                color: Colors.red,
              ),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb715);
    canvas.drawRect(Offset.zero & size, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 1.0;
    for (var i = 0; i <= 15; ++i) {
      var dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for (var i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
    paint.color = Colors.white;
    canvas.drawCircle(
        Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  GradientCircularProgressIndicator(
      {this.strokeWidth = 2.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xffeeeeee),
      this.totalAngle = 2 * pi,
      this.value});

  ///粗细
  final double strokeWidth;

  /// 圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }

    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  _GradientCircularProgressPainter(
      {this.strokeWidth = 10.0,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xffeeeeee),
      this.radius,
      this.total = 2 * pi,
      @required this.colors,
      this.stops,
      this.value});
  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;
  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2;
    print(value);
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;
    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }
    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }
    if (_value > 0) {
      paint.shader = SweepGradient(
              startAngle: 0.0, endAngle: _value, colors: colors, stops: stops)
          .createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class GraduebtCircularProgressRoute extends StatefulWidget {
  @override
  _GraduebtCircularProgressRouteState createState() =>
      _GraduebtCircularProgressRouteState();
}

class _GraduebtCircularProgressRouteState
    extends State<GraduebtCircularProgressRoute> with TickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        isForward = true;
      } else if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      } else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圆形进度条"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: <Widget>[
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 16.0,
                          children: <Widget>[
                            GradientCircularProgressIndicator(
                              colors: [Colors.blue, Colors.blue],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.red, Colors.orange, Colors.red],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              value: _animationController.value,
                            ),
                            GradientCircularProgressIndicator(
                              colors: [Colors.teal, Colors.cyan],
                              radius: 50.0,
                              strokeWidth: 3.0,
                              strokeCapRound: true,
                              value: CurvedAnimation(
                                      parent: _animationController,
                                      curve: Curves.decelerate)
                                  .value,
                            ),
                            TurnBox(
                              turns: 1 / 8,
                              child: GradientCircularProgressIndicator(
                                colors: [Colors.red, Colors.orange, Colors.red],
                                radius: 50.0,
                                strokeWidth: 5.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.red[50],
                                totalAngle: 1.5 * pi,
                                value: CurvedAnimation(
                                        parent: _animationController,
                                        curve: Curves.ease)
                                    .value,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                colors: [Colors.blue[700], Colors.blue[200]],
                                radius: 50.0,
                                strokeWidth: 3.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.transparent,
                                value: _animationController.value,
                              ),
                            ),
                            GradientCircularProgressIndicator(
                              colors: [
                                Colors.red,
                                Colors.amber,
                                Colors.cyan,
                                Colors.green[200],
                                Colors.blue,
                                Colors.red
                              ],
                              radius: 50.0,
                              strokeWidth: 5.0,
                              strokeCapRound: true,
                              value: _animationController.value,
                            ),
                            ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: .5,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    child: TurnBox(
                                      turns: 0.75,
                                      child: GradientCircularProgressIndicator(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 100.0,
                                        strokeWidth: 8.0,
                                        value: _animationController.value,
                                        totalAngle: pi,
                                        strokeCapRound: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 104.0,
                              width: 200.0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                    height: 200,
                                    top: .0,
                                    child: TurnBox(
                                      turns: .75,
                                      child: GradientCircularProgressIndicator(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 100.0,
                                        strokeWidth: 8.0,
                                        value: _animationController.value,
                                        totalAngle: pi,
                                        strokeCapRound: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "${(_animationController.value * 100).toInt()}%",
                                      style: TextStyle(
                                          fontSize: 25.0,
                                          color: Colors.blueGrey),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
