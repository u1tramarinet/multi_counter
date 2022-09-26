import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_counter/model/Counter.dart';
import 'package:multi_counter/viewmodel/MultiCounterViewModel.dart';

class MultiCounterPage extends ConsumerWidget {
  const MultiCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(multiCounterViewModelProvider);
    List<Counter> counters = viewModel.getCounters();
    int numOfItems = counters.length;

    return Scaffold(
      appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            const Text('Counters'),
            Text('$numOfItems ${(numOfItems > 1) ? 'items' : 'item'}'),
          ])),
      body: ListView.builder(
          itemCount: counters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${counters[index].index}: ${counters[index].title}',
                        style: Theme.of(context).textTheme.headline4,
                        overflow: TextOverflow.ellipsis),
                    Text('${counters[index].getCount}',
                        style: Theme.of(context).textTheme.headline6),
                  ]),
              onTap: () {
                viewModel.incrementCount(index: counters[index].index);
                showSnackBar(context: context, text: '${counters[index].title} のカウントを ${counters[index].getCount} にしました');
              },
              onLongPress: (){
                viewModel.resetCount(index: counters[index].index);
                showSnackBar(context: context, text: '${counters[index].title} のカウントをリセットしました');
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.add("test");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

void showSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: "閉じる",
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar;
        },
      ),);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
