import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Counter.dart';
import 'MultiCounter.dart';

final repositoryProvider = Provider((ref) => MultiCounterRepository());

class MultiCounterRepository {
  final MultiCounter _data = MultiCounter();

  Future<List<Counter>> get counter {
    return Future(() => _data.getCounters);
  }

  Future<List<Counter>> add(String title) {
    _data.addCounter(title);
    return Future.value(_data.getCounters);
  }

  Future<List<Counter>> remove({required int index}) {
    _data.removeCounter(index: index);
    return Future.value(_data.getCounters);
  }

  Future<List<Counter>> incrementCount({required int index}) {
    _data.incrementCounter(index: index);
    return Future.value(_data.getCounters);
  }

  Future<List<Counter>> resetCount({required int index}) {
    _data.resetCounter(index: index);
    return Future.value(_data.getCounters);
  }
}
