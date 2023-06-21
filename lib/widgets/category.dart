import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String title;
  const Category({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, style: BorderStyle.solid, color: Colors.black87),
            boxShadow: List.filled(1, BoxShadow(color: Colors.black)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.red),
        child: Center(child: Text(title)));
  }
}
