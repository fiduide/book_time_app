import 'package:book_time/app/searchPage/searchPage_view.dart';
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
      home: searchPage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
