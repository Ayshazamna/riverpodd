import 'package:flutter_riverpod/flutter_riverpod.dart';

final navIndexProvider = StateNotifierProvider<NavIndexNotifier, int>((ref) {
  return NavIndexNotifier();
});

class NavIndexNotifier extends StateNotifier<int> {
  NavIndexNotifier() : super(0); // Initial index

  void updateIndex(int newIndex) {
    state = newIndex;
  }
}