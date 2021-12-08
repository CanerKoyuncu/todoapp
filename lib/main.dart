import 'package:flutter/material.dart';
import 'package:todoapp/ui/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo App",
      initialRoute: "/",
      routes: {
        "/":(context) => HomeView() 
      },
    );
  }
}