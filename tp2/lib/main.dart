import 'package:counter_app/viewmodels/CounterViewModel.dart';
import 'package:counter_app/views/HomeView.dart';
import 'package:counter_app/views/SecondPageView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/constants.dart';
import 'models/CounterModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CounterViewModel counterViewModel = CounterViewModel(CounterModel());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => counterViewModel,
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeView(),
          '/second': (context) => const SecondPageView(),
        },
      ),
    );
  }

}