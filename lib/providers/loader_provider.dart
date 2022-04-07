import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderProvider = StateNotifierProvider.autoDispose<LoaderNotifier, bool>(
    (ref) => LoaderNotifier());

class LoaderNotifier extends StateNotifier<bool> {
  LoaderNotifier() : super(true);

  void setLoader(value) {
    state = value;
  }
}
