class Counter {
  final int index;
  final String title;
  int _count = 0;

  Counter({required this.index, this.title = 'untitled'});

  int get getCount {
    return _count;
  }

  void increment() {
    _count += 1;
  }

  void reset() {
    _count = 0;
  }
}
