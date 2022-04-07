import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../animations/undo_dialog.dart';

class UndoBtn extends ConsumerWidget {
  const UndoBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => undoDialog(context, ref),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          Icons.undo,
          color: Colors.white,
        ),
      ),
    );
  }
}
