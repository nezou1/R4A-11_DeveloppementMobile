import 'dart:math';
import 'CaseModel.dart';

class MapModel {
  int nbLine;
  int nbCol;
  int nbBomb;
  late List<List<CaseModel>> _cases;

  MapModel({required this.nbLine, required this.nbCol, required this.nbBomb}) {
    generateMap();
  }

  void initCases() {
    _cases = List.generate(
      nbLine,
          (i) => List.generate(nbCol, (j) => CaseModel()),
    );
  }

  void initBomb() {
    int bombsPlaced = 0;
    Random random = Random();
    while (bombsPlaced < nbBomb) {
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      if (!_cases[x][y].hasBomb) {
        _cases[x][y].hasBomb = true;
        bombsPlaced++;
      }
    }
  }

  CaseModel? tryGetCase(int x, int y) {
    if (x >= 0 && x < nbLine && y >= 0 && y < nbCol) {
      return _cases[x][y];
    }
    return null;
  }

  int computeNumber(int x, int y) {
    int count = 0;
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        CaseModel? neighbor = tryGetCase(x + i, y + j);
        if (neighbor != null && neighbor.hasBomb) {
          count++;
        }
      }
    }
    return count;
  }

  void initNumbers() {
    for (int i = 0; i < nbLine; i++) {
      for (int j = 0; j < nbCol; j++) {
        if (!_cases[i][j].hasBomb) {
          _cases[i][j].number = computeNumber(i, j);
        }
      }
    }
  }

  void generateMap() {
    initCases();
    initBomb();
    initNumbers();
  }

  /*void reveal(int x, int y) {
    if (!_cases[x][y].hasFlag) {
      _cases[x][y].hidden = false;
      if (_cases[x][y].hasBomb) {
        explode(x, y);
      }
    }
  }*/

  void reveal(int x, int y) {
    if (!_cases[x][y].hasFlag && _cases[x][y].hidden) {
      print("Révélation de la case : ($x, $y)"); // Debug
      _cases[x][y].hidden = false;
      if (_cases[x][y].hasBomb) {
        print("Boom! Bombe trouvée à ($x, $y)"); // Debug
        explode(x, y);
      }
    } else {
      print("Case déjà révélée ou marquée d'un drapeau : ($x, $y)");
    }
  }


  void revealAll() {
    for (var row in _cases) {
      for (var caseModel in row) {
        caseModel.hidden = false;
      }
    }
  }

  void explode(int x, int y) {
    _cases[x][y].hasExploded = true;
    revealAll();
  }

  void toggleFlag(int x, int y) {
    CaseModel? cell = tryGetCase(x, y);
    if (cell != null && cell.hidden) { // Seulement si la case est encore cachée
      cell.hasFlag = !cell.hasFlag; // Change l'état du drapeau
    }
  }


  List<List<CaseModel>> get cases => _cases;
}
