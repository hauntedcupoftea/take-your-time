import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DayState {
  ob1,
  ft1,
  ob2,
  ft2,
  rst;

  DayState next() {
    return DayState.values[(index + 1) % DayState.values.length];
  }
}

class DayStateNotifier extends Notifier<DayState> {
  @override
  DayState build() {
    return DayState.rst;
  }

  void goToNext() {
    state = state.next();
  }

  void setTo(DayState newState) {
    state = newState;
  }
}

final dayStateProvider = NotifierProvider<DayStateNotifier, DayState>(
  DayStateNotifier.new,
);
