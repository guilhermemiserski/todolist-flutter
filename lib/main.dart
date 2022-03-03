import 'package:flutter/material.dart';
import 'package:todolist_flutter/pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To-do list',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
