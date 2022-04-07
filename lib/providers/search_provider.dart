import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, int>((ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<int> {
  SearchNotifier() : super(0);

  void setSearch(int value) {
    state = value;
  }

  void reset() {
    state = 0;
  }

  int get idSearch {
    return state;
  }
}
