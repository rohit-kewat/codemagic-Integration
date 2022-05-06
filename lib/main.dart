import 'package:flutter/material.dart';
import 'package:flutter_codemagic_integration/MyCalculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator App',
      home: MyCalculator(),
    );
  }
}
