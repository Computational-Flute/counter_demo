class CounterModel {
  int count = 0;
  void incrementCounter() => count++;
  void decrementCounter() => (count > 0) ? count-- : count;
}
