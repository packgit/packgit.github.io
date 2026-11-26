import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';

/// Prominent page header with the application title.
class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final isDesktop = width >= Breakpoints.desktop;
    final isTablet = width >= Breakpoints.tablet;
    final titleSize = isDesktop ? 44.0 : (isTablet ? 36.0 : 26.0);
    final subtitleSize = isTablet ? 18.0 : 15.0;
    final vertical = isDesktop ? 56.0 : (isTablet ? 44.0 : 32.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 32 : 20,
        vertical: vertical,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.orangeSoft, Color(0xFFFFEBD1), AppColors.greenSoft],
        ),
        border: Border(
          bottom: BorderSide(color: AppColors.orangeAccent, width: 3),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 820),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Semantics(
                header: true,
                child: Text(
                  'Boost App Installs, Progress',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                    letterSpacing: -0.5,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '30 practical strategies to win more downloads. '
                'Tick them off as you go; your progress saves automatically.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: subtitleSize,
                  height: 1.45,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
