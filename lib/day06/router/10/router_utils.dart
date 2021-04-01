import 'package:flutter/material.dart';

// 缩放路由动画
class ScaleRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  ScaleRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    ScaleTransition(
                      scale: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(parent: animation, curve: curve)),
                      child: child,
                    ));
}

// 渐变透明路由动画
class FadeRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  FadeRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: Tween(begin: 0.1, end: 1.0).animate(
                          CurvedAnimation(parent: animation, curve: curve)),
                      child: child,
                    ));
}

// 旋转路由动画
class RotateRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  RotateRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: durationMs),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    RotationTransition(
                      turns: Tween(begin: 0.1, end: 1.0).animate(
                          CurvedAnimation(parent: animation, curve: curve)),
                      child: child,
                    ));
}

// 右到左
class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Right2LeftRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                SlideTransition(
                    child: child,
                    position: Tween<Offset>(
                            begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                        .animate(
                            CurvedAnimation(parent: animation, curve: curve))));
}

// 左到右
class Left2RightRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;
  List<int> mapper;

  // 左到右
  Left2RightRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : assert(true),
        super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (context, animation, secondaryAnimation) {
              return child;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                      .animate(
                          CurvedAnimation(parent: animation, curve: curve)),
                  child: child);
            });
}

//上--->下
class Top2BottomRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Top2BottomRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//下--->上
class Bottom2TopRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Bottom2TopRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => child,
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

// 缩放+透明+旋转路由动画
class ScaleFadeRotateRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  ScaleFadeRotateRouter(
      {this.child, this.durationMs = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, Widget child) =>
                    RotationTransition(
                      // 旋转
                      turns: Tween(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(parent: animation, curve: curve)),
                      child: ScaleTransition(
                        // 缩放
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(parent: animation, curve: curve)),
                        child: FadeTransition(
                          // 透明度
                          opacity: Tween(begin: 0.5, end: 1.0).animate(
                              CurvedAnimation(parent: animation, curve: curve)),
                          child: child,
                        ),
                      ),
                    ));
}

// 无动画
class NoAnimRouter<T> extends PageRouteBuilder<T> {
  final Widget page;

  NoAnimRouter(this.page)
      : super(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: 0),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}
