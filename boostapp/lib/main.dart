import 'package:material_ui/material_ui.dart';

import 'app.dart';
import 'data/strategies.dart';
import 'services/progress_storage.dart';
import 'state/progress_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await ProgressStorage.open();
  final controller = ProgressController(
    strategies: strategies,
    storage: storage,
  );
  runApp(BoostApp(controller: controller));
}
