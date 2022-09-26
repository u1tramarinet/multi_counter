import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/MultiCounterPage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with riverpod',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MultiCounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
