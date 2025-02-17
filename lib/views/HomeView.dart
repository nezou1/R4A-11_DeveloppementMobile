import 'package:flutter/material.dart';
import '../core/navigation/GameArguments.dart';
import '../widgets/CustomButton.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Démineur')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Simple',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/game',
                  arguments: GameArguments(10, 8, 10),
                );
              },
            ),
            CustomButton(
              label: 'Moyen',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/game',
                  arguments: GameArguments(18, 14, 40),
                );
              },
            ),
            CustomButton(
              label: 'Difficile',
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/game',
                  arguments: GameArguments(24, 20, 99),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
