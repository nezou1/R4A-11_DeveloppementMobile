import 'package:flutter/material.dart';

class VictoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Victoire !")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Félicitations, vous avez gagné ! 🎉", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
