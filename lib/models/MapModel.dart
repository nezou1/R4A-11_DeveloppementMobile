import 'dart:math';

import 'CaseModel.dart';

class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases(){
    _cases = List<List<CaseModel>>.generate(
      nbLine,(i) => List<CaseModel>.generate(
        nbCol, (j) => CaseModel()
      )
    );
  }

  void initBomb(){
    int bombsPlaced = 0;
    while(bombsPlaced < nbBomb){
      int x = Random().nextInt(nbLine);
      int y = Random().nextInt(nbCol);
      if(!_cases[x][y].hasBomb){
        _cases[x][y].hasBomb = true;
        bombsPlaced++;
      }
    }
  }

  CaseModel? tryGetCase(int x, int y){
    if(x >= 0 && x < nbLine && y >= 0 && y < nbCol){
      return _cases[x][y];
    }
    return null;
  }

  int computeNumber(int x, int y){
    int count = 0;
    for(int i = -1; i< 1; i++){
      for(int j = -1; j<1; j++){
        if(i != 0 && j != 0){
          CaseModel? neighbor = tryGetCase(x, y);
          if(neighbor != null && neighbor.hasBomb){
            count++;
          }
        }
      }
    }
    return count;
  }

  void initNumbers(){
    for(int i = 0; i< nbLine; i++){
      for(int j = 0; j<nbCol; j++){
        _cases[i][j].number = computeNumber(i, j);
      }
    }
  }

  void generateMap(){
    initCases();
    initBomb();
    initNumbers();
  }

  void revealAll() {
    for (var row in _cases) {
      for (var caseModel in row) {
        caseModel.hidden = false;
      }
    }
  }

  void explode(int x, int y) {
    _cases[x][y].hasExplosed = true;
    revealAll();
  }

  void reveal(int x, int y) {
    if (!_cases[x][y].hasFlag) {
      _cases[x][y].hidden = false;
      if (_cases[x][y].hasBomb) {
        explode(x, y);
      }
    }
  }

  void toggleFlag(int x, int y) {
    CaseModel? caseChosen = tryGetCase(x, y);
    if (caseChosen != null) {
      _cases[x][y].hasFlag = !_cases[x][y].hasFlag;
    }
  }

  // Getters
  List<List<CaseModel>> get cases => _cases;






}