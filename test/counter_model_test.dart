import 'package:counter_demo/counter_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Counter initilizes with 0
  test('Counter starts at 0', () {
    final model = CounterModel();
    expect(model.count, 0);
  });

  test('Counter increments', () {
    final model = CounterModel();
    model.incrementCounter();
    expect(model.count, 10);
  });

  test('Counter decrements', () {
    final model = CounterModel();
    model.incrementCounter();
    model.decrementCounter();
    expect(model.count, 0);
  });

  test('Counter does not go below zero', () {
    final model = CounterModel();
    expect(model.count, 0);
    model.decrementCounter();
    model.decrementCounter();
    expect(model.count, 0);
  });
}
