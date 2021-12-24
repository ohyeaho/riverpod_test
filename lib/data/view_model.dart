import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/logic.dart';
import 'package:riverpod_test/provider.dart';

class ViewModel {
  final Logic _logic = Logic();
  late WidgetRef ref;

  void setRef(WidgetRef ref) {
    this.ref = ref;
  }

  get count => ref.watch(countDataProvider).count.toString();
  get countUp =>
      ref.watch(countDataProvider.select((value) => value.countUp)).toString();
  get countDown => ref
      .watch(countDataProvider.select((value) => value.countDown))
      .toString();

  void onIncrease() {
    _logic.increase();

    ref.watch(countDataProvider.state).state = _logic.countData;
  }

  void onDecrease() {
    _logic.decrease();

    ref.watch(countDataProvider.state).state = _logic.countData;
  }

  void onReset() {
    _logic.reset();

    ref.watch(countDataProvider.state).state = _logic.countData;
  }
}
