import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/CounterModel.dart';

class CounterViewModel extends ChangeNotifier {
  CounterModel _model;

  int get counter => _model.getCounter;

  CounterViewModel(this._model);


  void incrementCounter() {
    _model.incrementCounter();
    notifyListeners();
  }

  void decrementCounter() {
    _model.decrementCounter();
    notifyListeners();
  }
}