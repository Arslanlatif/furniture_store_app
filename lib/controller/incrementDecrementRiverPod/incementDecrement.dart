// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

final incremDecremnetProvider =
    StateNotifierProvider.autoDispose<IncremDecremnetNotifier, Counter>((ref) {
  return IncremDecremnetNotifier();
});

class IncremDecremnetNotifier extends StateNotifier<Counter> {
  IncremDecremnetNotifier() : super(Counter(counter: 0));

  void increment() {
    state = Counter(counter: state.counter + 1);
  }

  void deccrement() {
    state = Counter(counter: state.counter - 1);
  }
}

class Counter {
  final int counter;

  Counter({
    required this.counter,
  });
}
