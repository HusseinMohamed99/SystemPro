import 'package:flutter/material.dart';

/// A responsive layout widget that adapts to different screen sizes.
///
/// Displays a different widget for:
/// - Mobile: width < 600
/// - Tablet: width >= 600 and < 900
/// - Desktop: width >= 900

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  /// Builder for small screen (e.g. phones)
  final WidgetBuilder mobileLayout;

  /// Builder for medium screen (e.g. tablets)
  final WidgetBuilder tabletLayout;

  /// Builder for large screen (e.g. desktops)
  final WidgetBuilder desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < 900) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
