import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/strategy.dart';
import '../theme/app_theme.dart';

/// One strategy: number, title, description, source link and completion toggle.
class StrategyCard extends StatelessWidget {
  const StrategyCard({
    super.key,
    required this.index,
    required this.strategy,
    required this.completed,
    required this.onChanged,
    required this.width,
  });

  final int index;
  final Strategy strategy;
  final bool completed;
  final ValueChanged<bool> onChanged;
  final double width;

  Future<void> _openLink() async {
    await launchUrl(
      Uri.parse(strategy.url),
      webOnlyWindowName: '_blank',
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = width >= Breakpoints.tablet;
    final isDesktop = width >= Breakpoints.desktop;
    final titleSize = isDesktop ? 20.0 : (isTablet ? 19.0 : 17.0);
    final bodySize = isTablet ? 16.0 : 15.0;
    final padding = isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        color: completed ? AppColors.greenSoft : AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: completed ? AppColors.green : AppColors.orangeSoft,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.orangeAccent.withValues(alpha: 0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: completed ? AppColors.green : AppColors.orangeAccent,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _NumberBadge(index: index, completed: completed),
                              _EffortChip(effort: strategy.effort),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            strategy.title,
                            style: TextStyle(
                              fontSize: titleSize,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            strategy.description,
                            style: TextStyle(
                              fontSize: bodySize,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _SourceLink(
                            label: strategy.sourceLabel,
                            onTap: _openLink,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: isTablet ? 20 : 12),
                    _CompletionToggle(
                      title: strategy.title,
                      value: completed,
                      onChanged: onChanged,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NumberBadge extends StatelessWidget {
  const _NumberBadge({required this.index, required this.completed});

  final int index;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: completed ? AppColors.green : AppColors.orangeSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (completed) ...[
            const Icon(Icons.check_rounded, size: 14, color: Colors.white),
            const SizedBox(width: 4),
          ],
          Text(
            completed ? 'Done' : 'Approach $index',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
              color: completed ? Colors.white : AppColors.orangeDeep,
            ),
          ),
        ],
      ),
    );
  }
}

class _EffortChip extends StatelessWidget {
  const _EffortChip({required this.effort});

  final int effort;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Effort $effort out of 10',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.greenSoft,
          border: Border.all(color: AppColors.green),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          'Effort $effort/10',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
            color: AppColors.greenDark,
          ),
        ),
      ),
    );
  }
}

class _SourceLink extends StatelessWidget {
  const _SourceLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      label: 'Read more at $label, opens in a new tab',
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  'Read more on $label',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greenDark,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.green,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.open_in_new_rounded,
                size: 16,
                color: AppColors.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompletionToggle extends StatelessWidget {
  const _CompletionToggle({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Mark "$title" as completed',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(value: value, onChanged: onChanged),
          Text(
            value ? 'Done' : 'To do',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: value ? AppColors.greenDark : AppColors.orangeDeep,
            ),
          ),
        ],
      ),
    );
  }
}
