// Agregue estilos y colores en main.dart o en un archivo separado de estilos.
// Este ejemplo utiliza el tema predeterminado de Flutter.

// lib/main.dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:examen_1/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Stephen King Books',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
