import 'package:flutter/material.dart';
import 'package:mvvmmbox/features/post/view/post_view.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:PostView(),
    );
  }
}


