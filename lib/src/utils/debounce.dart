import 'dart:async';

import 'package:flutter/foundation.dart';

class Debounce {
  Timer? _timer;

  void run(VoidCallback action, {int waitForMs = 750}) {
    // if this function is called before 500ms [waitForMs] expired
    //cancel the previous call
    _timer?.cancel();
    // set waitForMs timer for the [action] to be called
    _timer = Timer(Duration(milliseconds: waitForMs), action);
  }
}
