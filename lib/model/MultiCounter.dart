import 'Counter.dart';

class MultiCounter {
  final List<Counter> _counters = <Counter>[];
  int _lastIndex = -1;

  List<Counter> get getCounters {
    return _counters;
  }

  void addCounter(String title) {
    _lastIndex += 1;
    Counter newCounter = Counter(index: _lastIndex, title: title);
    _counters.add(newCounter);
  }

  void removeCounter({required int index}) {
    _counters.remove(_findCounter(index: index));
  }

  void incrementCounter({required int index}) {
    _findCounter(index: index)?.increment();
  }

  void resetCounter({required int index}) {
    _findCounter(index: index)?.reset();
  }

  Counter? _findCounter({required int index}) {
    for (int i = 0; i < _counters.length; i++) {
      if (_counters[i].index == index) {
        return _counters[i];
      }
    }
    return null;
  }
}
