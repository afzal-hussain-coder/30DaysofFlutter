import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Material(
        child: Center(
          child: Container(
            child: const Text("Hello Afzal"),
          ),
        ),
      ),
    );
  }
}
