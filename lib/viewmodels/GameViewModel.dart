import '../models/MapModel.dart';
import '../models/CaseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GameViewModel extends ChangeNotifier {
  final MapModel _mapModel;

  MapModel get mapModel => _mapModel;

  GameViewModel(this._mapModel);

  void click(int x, int y) {
    if (!_mapModel.tryGetCase(x, y)!.hasFlag) {
      print("Révélation de la case ($x, $y)"); // Debug
      _mapModel.reveal(x, y);
      if (_mapModel.tryGetCase(x, y)!.hasBomb) {
        print("Boom! Bombe trouvée à ($x, $y)");
        _mapModel.revealAll();
      }
      notifyListeners(); // 🔥 Met à jour l'interface
    }
  }


  void onLongPress(int x, int y) {
    _mapModel.toggleFlag(x, y);
    notifyListeners();
  }

  /*String getIcon(int x, int y) {
    CaseModel? cell = _mapModel.tryGetCase(x, y);
    if (cell == null) return 'assets/images/hidden.png';

    if (cell.hasFlag) {
      print("🚩 Flag détecté à ($x, $y)"); // Debug
      return 'assets/images/flag.png';
    }
    if (cell.hidden) return 'assets/images/hidden.png';
    if (cell.hasBomb) {
      return cell.hasExploded ? 'assets/images/exploded.png' : 'assets/images/bomb.png';
    }
    return 'assets/images/floor.png';
  }*/


}

