import 'package:flutter/material.dart';
import 'views/HomeView.dart';
import 'views/GameView.dart';
import 'views/GameOverView.dart';
import 'views/VictoryView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Démineur',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/game': (context) => GameView(),
        '/gameOver': (context) => GameOverView(),
        '/victory': (context) => VictoryView(),
      },
    );
  }
}
