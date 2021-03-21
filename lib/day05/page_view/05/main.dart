import 'package:flutter/material.dart';
import 'slide_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var show = SlidePage(
      config: PageConfig(autoPlay: true),
      children: List.generate(10, (index) => "assets/images/wy_300x200.jpg")
          .map((e) => Card(
                child: Image.asset(e, fit: BoxFit.cover,),
              ))
          .toList(),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: show),
      ),
    );
  }
}
