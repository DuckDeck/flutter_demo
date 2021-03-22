import 'package:flutter/widgets.dart';

class Nil extends Widget {
  const Nil({Key key}) : super(key: key);

  @override
  Element createElement() => _NimElelemt(this);
}

class _NimElelemt extends Element {
  _NimElelemt(Nil widget) : super(widget);

  @override
  // TODO: implement debugDoingBuild
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {
    // TODO: implement performRebuild
  }
}
