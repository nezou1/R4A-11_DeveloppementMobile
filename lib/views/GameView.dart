import 'package:flutter/material.dart';
import '../viewmodels/GameViewModel.dart';
import '../widgets/MapButton.dart';
import '../core/navigation/GameArguments.dart';
import '../models/MapModel.dart';

class GameView extends StatefulWidget {
  @override
  _GameViewState createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late GameViewModel gameViewModel;
  late GameArguments args;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)!.settings.arguments as GameArguments;
    gameViewModel = GameViewModel(MapModel(nbLine: args.nbLine, nbCol: args.nbCol, nbBomb: args.nbBomb));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Démineur')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back'),
              ),
              Text("Difficulté: ${args.nbLine}x${args.nbCol}"),
              Text("Bombes restantes: ${gameViewModel.mapModel.nbBomb}"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    gameViewModel.mapModel.generateMap();
                  });
                },
                child: const Text('Restart'),
              ),
            ],
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: gameViewModel,
              builder: (context, _) {
                return Table(
                  border: TableBorder.all(color: Colors.black),
                  defaultColumnWidth: FixedColumnWidth(40), // 🔥 Définit une largeur fixe par colonne
                  children: List.generate(
                    gameViewModel.mapModel.nbLine,
                        (i) => TableRow(
                      children: List.generate(
                        gameViewModel.mapModel.nbCol,
                            (j) => MapButton(x: i, y: j, gameViewModel: gameViewModel),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
