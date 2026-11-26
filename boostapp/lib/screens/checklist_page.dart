import 'package:material_ui/material_ui.dart';

import '../state/progress_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/app_header.dart';
import '../widgets/floating_progress_meter.dart';
import '../widgets/strategy_card.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({super.key, required this.controller});

  final ProgressController controller;

  static const double _maxContentWidth = 760;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final isTablet = width >= Breakpoints.tablet;
          final gutter = width >= Breakpoints.desktop ? 32.0 : (isTablet ? 28.0 : 14.0);
          final gap = isTablet ? 18.0 : 14.0;

          return Stack(
            children: [
              ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  final items = controller.strategies;
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(child: AppHeader(width: width)),
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(gutter, 28, gutter, 150),
                        sliver: SliverToBoxAdapter(
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: _maxContentWidth,
                              ),
                              child: Column(
                                children: [
                                  for (var i = 0; i < items.length; i++) ...[
                                    StrategyCard(
                                      key: ValueKey(items[i].id),
                                      index: i + 1,
                                      strategy: items[i],
                                      width: width,
                                      completed:
                                          controller.isCompleted(items[i].id),
                                      onChanged: (v) => controller
                                          .setCompleted(items[i].id, v),
                                    ),
                                    if (i != items.length - 1)
                                      SizedBox(height: gap),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Positioned(
                left: gutter,
                right: gutter,
                bottom: 0,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: isTablet ? 24 : 12),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 560),
                        child: ListenableBuilder(
                          listenable: controller,
                          builder: (context, _) => FloatingProgressMeter(
                            completed: controller.completedCount,
                            total: controller.total,
                            fraction: controller.fraction,
                            width: width,
                            onReset: controller.reset,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
