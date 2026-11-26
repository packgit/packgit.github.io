import 'package:boostapp/data/strategies.dart';
import 'package:boostapp/services/progress_storage.dart';
import 'package:boostapp/state/progress_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProgressController> _make() async {
  final storage = await ProgressStorage.open();
  return ProgressController(strategies: strategies, storage: storage);
}

void main() {
  test('progress persists across controller instances', () async {
    SharedPreferences.setMockInitialValues({});
    final first = await _make();
    expect(first.completedCount, 0);
    first.setCompleted('strategy-1', true);
    first.setCompleted('strategy-7', true);
    await Future<void>.delayed(Duration.zero);

    final second = await _make();
    expect(second.completedCount, 2);
    expect(second.isCompleted('strategy-7'), isTrue);
    expect(second.percent, 7);

    second.setCompleted('strategy-1', false);
    await Future<void>.delayed(Duration.zero);
    expect((await _make()).completedCount, 1);
  });
}
