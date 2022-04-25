import 'package:flutter/material.dart';
import 'package:startwar_app/page/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MainPage());
}
