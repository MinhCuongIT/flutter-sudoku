import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/loader_provider.dart';

class Loader extends ConsumerWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _loaderNotifier = ref.read(loaderProvider.notifier);

    //Show a loader for 1.5sec
    Timer(
      const Duration(milliseconds: 1500),
      () => _loaderNotifier.setLoader(false),
    );

    return const CircularProgressIndicator();
  }
}
