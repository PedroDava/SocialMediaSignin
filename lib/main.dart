import 'package:flock_payment/views/login.dart';
import 'package:flutter/material.dart';
// import 'views/creatorpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flock Payment',
      home: Login(),
    );
  }
}
