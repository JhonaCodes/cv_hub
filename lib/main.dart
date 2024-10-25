import 'package:cvhub/ui/layout/main_layout.dart';

import 'package:flutter/material.dart';
import 'package:cvhub/ui/screen/standard_cv.dart'; //mi nueva cv (andres)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainLayout(
        child: const StandardCV(), //  constante
      ),
    );
  }
}
