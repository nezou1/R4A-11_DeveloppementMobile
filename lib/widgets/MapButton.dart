import 'package:flutter/material.dart';
import '../viewmodels/GameViewModel.dart';

class MapButton extends StatelessWidget {
  final int x;
  final int y;
  final GameViewModel gameViewModel;

  const MapButton({Key? key, required this.x, required this.y, required this.gameViewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final caseModel = gameViewModel.mapModel.tryGetCase(x, y);
    final bool isRevealed = caseModel != null && !caseModel.hidden;
    final bool hasFlag = caseModel?.hasFlag ?? false;
    final bool hasBomb = caseModel?.hasBomb ?? false;
    final bool hasExploded = caseModel?.hasExploded ?? false;
    final int bombCount = caseModel?.number ?? 0;

    return InkWell(
      onTap: () => gameViewModel.click(x, y),
      onLongPress: () => gameViewModel.onLongPress(x, y),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isRevealed ? Colors.brown[300] : Colors.green[500], // Floor = sable, Hidden = vert
              border: Border.all(color: Colors.black),
            ),
          ),

          if (hasFlag)
            const Icon(Icons.flag, color: Colors.red, size: 30),

          if (isRevealed && hasBomb)
            const Icon(Icons.circle, color: Colors.black, size: 30),

          if (isRevealed && hasExploded)
            const Icon(Icons.warning, color: Colors.red, size: 35),

          if (isRevealed && bombCount > 0 && !hasBomb)
            Text(
              "$bombCount",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adapte la couleur pour le contraste
              ),
            ),
        ],
      ),
    );
  }
}
