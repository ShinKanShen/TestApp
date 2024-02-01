import 'package:flutter/material.dart';
import 'package:thuc_tap/main_menu.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return const MainMenu();
      },
      title: "BSC",
    );
  }
}
