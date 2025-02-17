import 'package:flutter/material.dart';

class GameOverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Game Over")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Vous avez perdu !", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retour à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}
