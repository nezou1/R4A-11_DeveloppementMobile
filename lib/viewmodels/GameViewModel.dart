import '../models/MapModel.dart';
import '../models/CaseModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class GameViewModel extends ChangeNotifier {
  late MapModel _mapModel ;

  MapModel get mapModel => _mapModel;

  GameViewModel(this._mapModel);

  void generateMap() {
    _mapModel.generateMap();
  }

  void click(int x, int y) {
    if (!_mapModel.tryGetCase(x, y)!.hasFlag) {
      _mapModel.reveal(x, y);
      if (_mapModel.tryGetCase(x, y)!.hasBomb) {
        _mapModel.revealAll();
      }
    }
  }

  void onLongPress(int x, int y) {
    _mapModel.toggleFlag(x, y);
  }

  String getIcon(int x, int y) {
    CaseModel? cell = _mapModel.tryGetCase(x, y);
    if (cell == null) return '';

    if (cell.hasFlag) return 'assets/images/flag.png';
    if (cell.hidden) return 'assets/images/hidden.png';
    if (cell.hasBomb) {
      return cell.hasExploded
          ? 'assets/images/exploded.png'
          : 'assets/images/bomb.png';
    }
    return 'assets/images/${cell.number}.png';
  }
}
