import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberNotifier extends StateNotifier<int> {
  NumberNotifier() : super(0);

  void add(int a) => state += a;

  void subtract(int a) => state -= a;
}

final demoProvider = StateNotifierProvider<NumberNotifier, int>((ref) {
  return NumberNotifier();
});
