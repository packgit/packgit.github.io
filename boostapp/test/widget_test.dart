import 'package:boostapp/app.dart';
import 'package:boostapp/data/strategies.dart';
import 'package:boostapp/services/progress_storage.dart';
import 'package:boostapp/state/progress_controller.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('toggling a card updates the floating meter', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final controller = ProgressController(
      strategies: strategies,
      storage: await ProgressStorage.open(),
    );
    await tester.binding.setSurfaceSize(const Size(900, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(BoostApp(controller: controller));
    expect(find.text('Boost App Installs, Progress'), findsOneWidget);
    expect(find.text('0 / 30 Completed'), findsOneWidget);

    await tester.tap(find.byType(Switch).first);
    await tester.pumpAndSettle();
    expect(find.text('1 / 30 Completed'), findsOneWidget);
  });
}
