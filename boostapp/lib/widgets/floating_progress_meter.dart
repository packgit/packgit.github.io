import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';

/// Pill-shaped meter pinned to the viewport showing "n / total Completed".
class FloatingProgressMeter extends StatelessWidget {
  const FloatingProgressMeter({
    super.key,
    required this.completed,
    required this.total,
    required this.fraction,
    required this.width,
    this.onReset,
  });

  final int completed;
  final int total;
  final double fraction;
  final double width;
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    final isTablet = width >= Breakpoints.tablet;
    final percent = (fraction * 100).round();
    final done = completed == total && total > 0;

    return Semantics(
      container: true,
      liveRegion: true,
      label: '$completed of $total strategies completed, $percent percent',
      child: Material(
        color: AppColors.surface,
        elevation: 10,
        shadowColor: AppColors.greenDark.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 22 : 16,
            vertical: isTablet ? 16 : 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.green, width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    done
                        ? Icons.emoji_events_rounded
                        : Icons.rocket_launch_rounded,
                    color: AppColors.greenDark,
                    size: isTablet ? 26 : 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      done
                          ? '$completed / $total Completed - amazing!'
                          : '$completed / $total Completed',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isTablet ? 18 : 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    '$percent%',
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.greenDark,
                    ),
                  ),
                  if (onReset != null && completed > 0) ...[
                    const SizedBox(width: 4),
                    IconButton(
                      tooltip: 'Reset progress',
                      visualDensity: VisualDensity.compact,
                      onPressed: onReset,
                      icon: const Icon(
                        Icons.restart_alt_rounded,
                        color: AppColors.orangeDeep,
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(end: fraction),
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value,
                    minHeight: isTablet ? 12 : 10,
                    backgroundColor: AppColors.orangeSoft,
                    valueColor: const AlwaysStoppedAnimation(AppColors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
