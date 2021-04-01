import 'package:flutter/material.dart';
import 'detail_pager.dart';
import 'home_page.dart';
import '../10/router_utils.dart';

class Routers {
  static const String detail = 'detail';
  static const String home = '/';
  static const String logo = 'logo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) { // 根据名称跳转相应页面
      case Routers.detail:
        return ScaleFadeRotateRouter(
          child: DetailPager()
        );
      case Routers.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routers.logo:
        return MaterialPageRoute(builder: (_) => FlutterLogo());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}