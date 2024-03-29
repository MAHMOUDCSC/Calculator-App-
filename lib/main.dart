import 'package:flutter/material.dart';
import 'modelus/calculator.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Calculater App",
      debugShowMaterialGrid: false,
      home: Calculator(),
    );
  }
}
