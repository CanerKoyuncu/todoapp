import 'package:flutter/material.dart';
import 'package:todoapp/ui/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      initialRoute: "/",
      routes: {
        "/":(context) => const HomeView() 
      },
    );
  }
}