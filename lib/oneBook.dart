import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class oneBook extends StatelessWidget{
  final String id;
  final String name;


  const oneBook(this.id, this.name);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(id),
          Text(name),
        ],
      ),
    );
  }

}