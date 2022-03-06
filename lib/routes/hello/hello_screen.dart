import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('hello world!'),
    );
  }
}
