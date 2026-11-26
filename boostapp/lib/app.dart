import 'package:material_ui/material_ui.dart';

import 'screens/checklist_page.dart';
import 'state/progress_controller.dart';
import 'theme/app_theme.dart';

class BoostApp extends StatelessWidget {
  const BoostApp({super.key, required this.controller});

  final ProgressController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boost App Installs, Progress',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: ChecklistPage(controller: controller),
    );
  }
}
