class CounterModel {
  int _counter = 0;

  //getter
  int get getCounter => _counter;

  void incrementCounter() {
    _counter ++;
  }

  void decrementCounter() {
    _counter --;
  }

}