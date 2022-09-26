import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_counter/model/MultiCounterRepository.dart';
import 'package:multi_counter/model/Counter.dart';

final multiCounterViewModelProvider =
    ChangeNotifierProvider((ref) => MultiCounterViewModel());

class MultiCounterViewModel extends ChangeNotifier {
  final MultiCounterRepository _repository = MultiCounterRepository();
  List<Counter> _counters = [];

  List<Counter> getCounters() {
    return _counters;
  }

  void add(String title) {
    _repository.add(title).then((counters) {
      _restoreAndNotify(counters: counters);
    });
  }

  void remove({required int index}) {
    _repository.remove(index: index).then((counters) {
      _restoreAndNotify(counters: counters);
    });
  }

  void incrementCount({required int index}) {
    _repository.incrementCount(index: index).then((counters) {
      _restoreAndNotify(counters: counters);
    });
  }

  void resetCount({required int index}) {
    _repository.resetCount(index: index).then((counters) {
      _restoreAndNotify(counters: counters);
    });
  }

  void _restoreAndNotify({required List<Counter> counters}) {
    _counters = counters;
    notifyListeners();
  }
}
