import 'package:cvhub/routes/routes.dart';
import 'package:cvhub/ui/layout/main_layout.dart';

import 'package:flutter/material.dart';
import 'package:cvhub/ui/screen/standard_cv.dart'; //mi nueva cv (andres)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CV Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: Routes.initial(),

    );
  }
}

/// Gestor de estado: Riverpod + Viewmodel(Repository)
/// Guardar localmente con sqflite -> Guardar contacto, eliminar contacto, edit url contacto, refresh
/// Guardar shared preferences.