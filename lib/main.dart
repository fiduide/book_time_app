import 'package:flutter/material.dart';
import 'app/homePage/homePage_view.dart';
import 'login.dart';

void main() => runApp(BookTime());

class BookTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book Time',
      theme: ThemeData.dark(),
      home: LoginPage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
